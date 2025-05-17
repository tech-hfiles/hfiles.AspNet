using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using System;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Collections.Generic;
using Microsoft.Graph.Models;
using System.Security.Cryptography.X509Certificates;
using System.IO;
using System.Web;
using Microsoft.Graph.Models.Partners.Billing;
using Org.BouncyCastle.Asn1.Cmp;
using Azure;
using System.Linq;
using PdfSharp.Drawing;
using PdfSharp.Pdf;

namespace hfiles
{
    public partial class CreateAbhaCard : System.Web.UI.Page
    {
        private static readonly string gatewayUrl = "https://dev.abdm.gov.in/gateway/v0.5/sessions";
        private static readonly string baseUrl = "https://abhasbx.abdm.gov.in/abha/api/v3/enrollment";
        private static readonly string publicKeyUrl = "https://abhasbx.abdm.gov.in/abha/api/v3/profile/public/certificate";

        private static string accessToken, userAccessToken, phrAddress;
        private static DateTime tokenExpiryTime;
        private static readonly string clientId = "SBXID_008483";
        //ConfigurationManager.AppSettings["ClientId"];
        private static readonly string clientSecret = "bae87a0f-54f3-4ea7-8dcf-5d2d70ab8d6d";
        //ConfigurationManager.AppSettings["ClientSecret"];
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                GetAccessToken();
            }
        }

        private static async Task<string> GetAccessToken()
        {
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            if (!string.IsNullOrEmpty(accessToken) && DateTime.Now < tokenExpiryTime)
                return accessToken; // ✅ Use existing token if valid

            using (HttpClient client = new HttpClient())
            {
                var requestBody = new
                {
                    clientId = clientId,
                    clientSecret = clientSecret,
                    grantType = "client_credentials"
                };

                client.DefaultRequestHeaders.Add("X-Api-Key", clientId);
                client.DefaultRequestHeaders.Add("X-Api-Secret", clientSecret);
                client.DefaultRequestHeaders.Add("REQUEST-ID", Guid.NewGuid().ToString());
                client.DefaultRequestHeaders.Add("TIMESTAMP", DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString());
                client.DefaultRequestHeaders.Add("X-CM-ID", "sbx");

                string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
                HttpContent content = new StringContent(jsonData, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PostAsync("https://dev.abdm.gov.in/api/hiecm/gateway/v3/sessions", content);
                string responseString = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = JObject.Parse(responseString);
                    accessToken = jsonResponse["accessToken"].ToString();
                    tokenExpiryTime = DateTime.Now.AddSeconds(Convert.ToDouble(jsonResponse["expiresIn"]));
                    return accessToken;  // ✅ Ensure the token is returned
                }
                else
                {
                    throw new Exception("❌ Failed to get token: " + responseString);
                }
            }
        }


        private static async Task<string> GetPublicKey(string accessToken)
        {
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    client.DefaultRequestHeaders.Add("request-Id", Guid.NewGuid().ToString());
                    client.DefaultRequestHeaders.Add("timestamp", DateTime.UtcNow.ToString("o"));
                    client.DefaultRequestHeaders.Add("Authorization", $"Bearer {accessToken}");

                    HttpResponseMessage response = await client.GetAsync("https://abhasbx.abdm.gov.in/abha/api/v3/profile/public/certificate");
                    string responseString = await response.Content.ReadAsStringAsync();

                    System.Diagnostics.Debug.WriteLine("🔹 Public Key API Response: " + responseString);

                    if (response.IsSuccessStatusCode)
                    {
                        string rawPublicKey = responseString.Trim();

                        var jsonResponse = JsonConvert.DeserializeObject<Dictionary<string, string>>(responseString);

                        if (jsonResponse == null || !jsonResponse.ContainsKey("publicKey"))
                        {
                            throw new Exception("❌ Invalid Public Key Response.");
                        }

                        string publicKeyBase64 = jsonResponse["publicKey"];

                        // ✅ Step 2: Validate the extracted key
                        if (!IsValidBase64(publicKeyBase64))
                        {
                            throw new Exception("❌ Extracted Public Key is not a valid Base64 string.");
                        }

                        System.Diagnostics.Debug.WriteLine("🔑 Extracted Public Key: " + publicKeyBase64);

                        return publicKeyBase64;


                    }
                    else
                    {
                        throw new Exception($"❌ API Call Failed: {response.StatusCode} | Response: {responseString}");
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("❌ Error in GetPublicKey: " + ex.Message);
                }
            }

        }
        private static bool IsValidBase64(string base64String)
        {
            if (string.IsNullOrEmpty(base64String) || base64String.Length % 4 != 0)
                return false;

            return Regex.IsMatch(base64String, @"^[a-zA-Z0-9\+/]*={0,2}$");
        }


        private static string EncryptWithPublicKey(string publicKeyPem, string data)
        {
            try
            {
                // ✅ Step 1: Clean the Public Key (Remove Headers & Newlines)
                string publicKeyBase64 = Regex.Replace(publicKeyPem, @"-----BEGIN PUBLIC KEY-----|-----END PUBLIC KEY-----|\s+", "");
                byte[] publicKeyBytes = Convert.FromBase64String(publicKeyBase64);

                // ✅ Step 2: Convert PEM Public Key to RSA Parameters

            AsymmetricKeyParameter asymmetricKeyParameter = PublicKeyFactory.CreateKey(publicKeyBytes);

                RsaKeyParameters rsaKeyParameters = (RsaKeyParameters)asymmetricKeyParameter;

                // ✅ Step 3: Create RSA Public Key from Parameters
                RSAParameters rsaParameters = new RSAParameters
                {
                    Modulus = rsaKeyParameters.Modulus.ToByteArrayUnsigned(),
                    Exponent = rsaKeyParameters.Exponent.ToByteArrayUnsigned()
                };

                using (RSACng rsa = new RSACng())
                {
                    rsa.ImportParameters(rsaParameters);

                    // ✅ Step 4: Encrypt Aadhaar Number Using RSA-OAEP SHA-1 Padding
                    byte[] encryptedData = rsa.Encrypt(Encoding.UTF8.GetBytes(data), RSAEncryptionPadding.OaepSHA1);

                    // ✅ Step 5: Return Encrypted Aadhaar in Base64
                    return Convert.ToBase64String(encryptedData);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("❌ RSA Encryption Error: " + ex.Message);
            }
        }







        private static byte[] ConvertPKCS8ToCspBlob(byte[] pkcs8PublicKey)
        {
            byte[] cspBlob = new byte[pkcs8PublicKey.Length + 20];

            // ✅ Correct Byte Structure for CSP Key
            System.Buffer.BlockCopy(new byte[] { 0x06, 0x02, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x52, 0x53, 0x41, 0x31, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0, cspBlob, 0, 20);
            System.Buffer.BlockCopy(pkcs8PublicKey, 0, cspBlob, 20, pkcs8PublicKey.Length);

            return cspBlob;
        }






        protected async void BtnGenerateOtp_Click(object sender, EventArgs e)
        {
            string token = await GetAccessToken();
            string aadhaarNumber = TxtAadhaar.Text.Trim();

            if (string.IsNullOrEmpty(aadhaarNumber))
            {
                LblMessage.Text = "❌ Please enter a valid Aadhaar Number.";
                return;
            }

            try
            {
                string publicKey = await GetPublicKey(token);
                string encryptedAadhaar = EncryptWithPublicKey(publicKey, aadhaarNumber);
                using (HttpClient client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + accessToken);
                    client.DefaultRequestHeaders.Add("TIMESTAMP", DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fffZ"));
                    client.DefaultRequestHeaders.Add("REQUEST-ID", Guid.NewGuid().ToString());

                    var requestBody = new
                    {
                        scope = new[] { "abha-enrol" },
                        loginHint = "aadhaar",
                        loginId = encryptedAadhaar,
                        otpSystem = "aadhaar"
                    };

                    string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
                    HttpContent content = new StringContent(jsonData, Encoding.UTF8, "application/json");
                    HttpResponseMessage response = await client.PostAsync(baseUrl + "/request/otp", content);
                    string responseString = await response.Content.ReadAsStringAsync();

                    if (response.IsSuccessStatusCode)
                    {
                        var jsonResponse = JObject.Parse(responseString);
                        Session["txnId"] = jsonResponse["txnId"].ToString();
                        Session["mobile"] = jsonResponse["mobile"]?.ToString();  // ✅ Store mobile number
                        LblMessage.Text = " OTP sent successfully!";
                    }
                    else
                    {
                        LblMessage.Text = "❌ Error: " + responseString;
                    }
                }
            }
            catch (Exception ex)
            {
                LblMessage.Text = "❌ Encryption Error: " + ex.Message;
            }
        }





        protected async void BtnVerifyOtp_Click(object sender, EventArgs e)
        {
            string token = await GetAccessToken();

            string otp = TxtOtp.Text.Trim();
            string txnId = Session["txnId"]?.ToString();
            string mobileNumber = TxtMobile.Text.Trim();

            if (string.IsNullOrEmpty(txnId))
            {
                LblMessage.Text = "❌ Transaction ID missing. Please generate OTP again.";
                return;
            }
            if (string.IsNullOrEmpty(mobileNumber))
            {
                LblMessage.Text = "❌ Please enter a valid mobile number.";
                return;
            }

            try
            {
                // ✅ Get Public Key & Encrypt OTP
                string publicKey = await GetPublicKey(token);
                string encryptedOtp = EncryptWithPublicKey(publicKey, otp);

                using (HttpClient client = new HttpClient())
                {
                    string timestamp = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fffZ");

                    // ✅ Add Headers
                    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + accessToken);
                    client.DefaultRequestHeaders.Add("TIMESTAMP", timestamp);
                    client.DefaultRequestHeaders.Add("REQUEST-ID", Guid.NewGuid().ToString());

                    // ✅ API Request Body
                    var requestBody = new
                    {
                        authData = new
                        {
                            authMethods = new[] { "otp" },
                            otp = new
                            {
                                txnId = txnId,  // ✅ Ensure txnId is passed correctly
                                otpValue = encryptedOtp,  // ✅ Use Encrypted OTP
                                mobile = mobileNumber  // ✅ Use entered mobile number
                            }
                        },
                        consent = new
                        {
                            code = "abha-enrollment",
                            version = "1.4"
                        }
                    };

                    string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
                    HttpContent content = new StringContent(jsonData, Encoding.UTF8, "application/json");

                    // ✅ Send API Request
                    HttpResponseMessage response = await client.PostAsync("https://abhasbx.abdm.gov.in/abha/api/v3/enrollment/enrol/byAadhaar", content);
                    string responseString = await response.Content.ReadAsStringAsync();

                    if (response.IsSuccessStatusCode)
                    {
                        var jsonResponse = JObject.Parse(responseString);

                        // ✅ Store ABHA Number & PHR Address
                        string abhaNumber = jsonResponse["ABHAProfile"]["ABHANumber"].ToString();
                        phrAddress = jsonResponse["ABHAProfile"]["phrAddress"]?[0]?.ToString(); // ✅ Get PHR Address
                        userAccessToken = jsonResponse["tokens"]?["token"].ToString();

                        Session["phrAddress"] = phrAddress; // ✅ Store PHR Address for status check
                                                            //  TxtAbha.Text = abhaNumber;  // ✅ Update TextBox

                        LblMessage.Text = "✅ ABHA Number Generated: " + abhaNumber;
                        LblAbhaNumber.Text = jsonResponse["ABHAProfile"]?["ABHANumber"]?.ToString();
                        LblName.Text = $"{jsonResponse["ABHAProfile"]?["firstName"]} {jsonResponse["ABHAProfile"]?["middleName"]} {jsonResponse["ABHAProfile"]?["lastName"]}";
                        LblGender.Text = jsonResponse["ABHAProfile"]?["gender"]?.ToString();
                        LblDOB.Text = jsonResponse["ABHAProfile"]?["dob"]?.ToString();
                        LblMobile.Text = jsonResponse["ABHAProfile"]?["mobile"]?.ToString();
                        LblAddress.Text = jsonResponse["ABHAProfile"]?["address"]?.ToString();
                        LblStatus.Text = jsonResponse["ABHAProfile"]?["abhaStatus"]?.ToString();
                        string base64 = jsonResponse["ABHAProfile"]?["photo"].ToString(); // Replace with your parsing logic
                        imgPhoto.ImageUrl = "data:image/jpeg;base64," + base64;
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowABHACard", "document.getElementById('abhaCard').style.display = 'block';", true);
                        LblMessage.Text = "ABHA Details Fetched Successfully!";
                    }
                    else
                    {
                        LblMessage.Text = "❌ Error: " + responseString;
                    }
                }
            }
            catch (Exception ex)
            {
                LblMessage.Text = "❌ Exception: " + ex.Message;
            }
        }

        protected async void BtnDownloadCard_Click(object sender, EventArgs e)
        {
            try
            {
                string token = await GetAccessToken(); // Or get it from your session if stored
                byte[] cardPdf = await DownloadAbhaCard();
                //byte[] imageBytes = await DownloadAbhaCard(); // This is PNG
                byte[] pdfBytes = ConvertImageToPdf(cardPdf);

                //Response.Clear();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=ABHA_Card.pdf");
                Response.BinaryWrite(pdfBytes);
                Response.End();
                LblMessage.Text = "Abha Card has been downloaded Successfully!";

                //HttpContext.Current.Response.Clear();
                //HttpContext.Current.Response.ContentType = "application/pdf";
                //HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=ABHA-Card.pdf");
                //HttpContext.Current.Response.OutputStream.Write(cardPdf, 0, cardPdf.Length);
                //HttpContext.Current.Response.Flush();
                //HttpContext.Current.Response.End();
            }
            catch (Exception ex)
            {
                LblMessage.Text = "❌ Failed to download card: " + ex.Message;
            }
        }



        public static async Task<byte[]> DownloadAbhaCard()
        {
            using (HttpClient client = new HttpClient())
            {

                try
                {
                    client.DefaultRequestHeaders.Clear();

                    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + accessToken);
                    string timestamp = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fffZ");
                    client.DefaultRequestHeaders.Add("TIMESTAMP", timestamp);
                    client.DefaultRequestHeaders.Add("REQUEST-ID", Guid.NewGuid().ToString());
                    client.DefaultRequestHeaders.Add("X-Token", "Bearer " + userAccessToken);
                    string url = "https://abhasbx.abdm.gov.in/abha/api/v3/profile/account/abha-card";
                    HttpResponseMessage response = await client.GetAsync(url);

                    if (response.IsSuccessStatusCode)
                    {
                        byte[] cardBytes = await response.Content.ReadAsByteArrayAsync();
                        string contentType = response.Content.Headers.ContentType.MediaType;
                        //File.WriteAllBytes(@"C:\Users\Admin123\Desktop\prajakta VsSolns Hfiles\abha_card.pdf", cardBytes);
                        return cardBytes;
                    }
                    else
                    {
                        string error = await response.Content.ReadAsStringAsync();
                        throw new Exception("❌ ABHA Card download failed: " + error);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("❌ Exception in DownloadAbhaCard: " + ex.Message);
                }
            }
        }
        public static byte[] ConvertImageToPdf(byte[] imageBytes)
        {
            var sanitizedStream = SanitizeImageStream(imageBytes);
            using (MemoryStream imgStream = new MemoryStream(imageBytes))
            using (MemoryStream pdfStream = new MemoryStream())
            {
                using (PdfDocument document = new PdfDocument())
                {
                    PdfPage page = document.AddPage();
                    XGraphics gfx = XGraphics.FromPdfPage(page);

                    imgStream.Position = 0; // Make sure stream is at start
                    using (XImage image = XImage.FromStream(sanitizedStream))
                    {
                        page.Width = XUnit.FromPoint(image.PixelWidth);
                        page.Height = XUnit.FromPoint(image.PixelHeight);
                        gfx.DrawImage(image, 0, 0);
                    }

                    document.Save(pdfStream);
                }

                return pdfStream.ToArray(); // ✅ Always use ToArray, not GetBuffer
            }
        }
        private static MemoryStream SanitizeImageStream(byte[] imageBytes)
        {
            using (var img = System.Drawing.Image.FromStream(new MemoryStream(imageBytes)))
            {
                var bmp = new System.Drawing.Bitmap(img.Width, img.Height);
                using (var g = System.Drawing.Graphics.FromImage(bmp))
                {
                    g.Clear(System.Drawing.Color.White); // Fill background if image has transparency
                    g.DrawImage(img, 0, 0, img.Width, img.Height);
                }

                var ms = new MemoryStream();
                bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg); // Save as JPEG (PDFSharp safe)
                ms.Position = 0;
                return ms;
            }
        }


    }
}
