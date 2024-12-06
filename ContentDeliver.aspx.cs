using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class ContentDeliver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Request.QueryString["file"];
            string expires = Request.QueryString["expires"];
            string token = Request.QueryString["token"];

            // Validate the URL
            if (!ValidateFileLink(filePath, expires, token))
            {
                // Invalid or expired link
                Response.StatusCode = 403; // Forbidden
                Response.Write("This link has expired or is invalid.");
                return;
                // Optionally you could redirect to an error page here:
                 //Response.Redirect("/ContentDeliver.aspx");
            }

            else
            {
                // Debugging: Output the file path to check its value
                Response.Write($"File Path: {filePath} <br>");

                // Ensure the base URL is correct and combine with the file path
                string fileUrl = "https://localhost:44335" + filePath; // Correct URL formation

                // Debugging: Output the full file URL before redirecting
                Response.Write($"Full File URL: {fileUrl} <br>");

                // Now, redirect to the full file URL
                Response.Redirect(fileUrl);
            }





            //else
            //{
            //    // The link is valid, so redirect to the file
            //    string fileUrl = "https://localhost:44335" + filePath; // Correct URL formation
            //    Response.Redirect(fileUrl);
            //}
        }
        private bool ValidateFileLink(string filePath, string expires, string token)
        {
            try
            {
                // Ensure the filePath is decoded properly
                filePath = HttpUtility.UrlDecode(filePath);

                // Validate the `expires` parameter
                if (!long.TryParse(expires, out long expiryTimestamp))
                {
                    return false; // Invalid expiration timestamp
                }

                // Check if the link has expired
                DateTime expiryTime = DateTimeOffset.FromUnixTimeSeconds(expiryTimestamp).UtcDateTime;
                if (DateTime.UtcNow > expiryTime)
                {
                    return false; // Link has expired
                }

                // Validate the token
                string secretKey = "zxcvbnm"; // Use the same secret key as in GenerateWhatsAppUrl
                string baseUrl = "https://localhost:44335/ContentDeliver.aspx/" + filePath; // Correct base URL construction
                string expectedToken = GenerateToken(baseUrl, expiryTimestamp, secretKey);

                // Compare the provided token with the expected token
                return token == expectedToken;
            }
            catch
            {
                return false; // Invalid link due to errors in the validation process
            }
        }

        

        private string GenerateToken(string fileUrl, long expiryTimestamp, string secretKey)
        {
            // Combine the file URL and expiry timestamp
            string dataToHash = $"{fileUrl}|{expiryTimestamp}";

            // Generate the hash using HMACSHA256
            using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(secretKey)))
            {
                byte[] hashBytes = hmac.ComputeHash(Encoding.UTF8.GetBytes(dataToHash));
                return Convert.ToBase64String(hashBytes).TrimEnd('=').Replace('+', '-').Replace('/', '_');
            }
        }

    }
}