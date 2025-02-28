using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
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
           

           


            
            string tokenIdStr = Request.QueryString["token"];
            if (!string.IsNullOrEmpty(tokenIdStr) && Guid.TryParse(tokenIdStr, out Guid tokenId))
            {
                // Try to fetch the token data from cache using tokenId as the key
                var tokenData = HttpContext.Current.Cache[tokenId.ToString()] as dynamic;

                if (tokenData != null)
                {
                    DateTime utcNow = DateTime.UtcNow;

                    // Define the IST timezone
                    TimeZoneInfo istTimeZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

                    // Convert UTC to IST
                    DateTime indiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, istTimeZone);
                    // Check if the token has expired
                    if (tokenData.Expiry >indiaTime)
                    {
                        // Valid token; proceed
                        string filePath = tokenData.FilePath;
                        //Response.Redirect(filePath);
                        /*string fileUrl = "https://example.com/path/to/your/file.pdf";*/ // Replace with your actual file URL
                        string fileExtension = System.IO.Path.GetExtension(filePath).ToLower();

                        EmbedFile(fileExtension, filePath);
                        //Response.Write($"Token is valid. File Path: {filePath}");
                    }
                    else
                    {
                        // Token has expired
                        Response.Write("link has expired.");
                    }
                }
                else
                {
                    // Invalid or missing token
                    Response.Write("Invalid token.");
                }
            }
            else
            {
                // Invalid token format
                Response.Write("Invalid token format.");
            }

        }
        private void EmbedFile(string fileExtension, string fileUrl)
        {
            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
            {
                // Embed an image
                Response.Write($"<img src='{fileUrl}' alt='Image Preview' style='width: 100%; height: auto;' />");
            }
            else if (fileExtension == ".pdf")
            {
                // Embed a PDF
                Response.Write($"<embed src='{fileUrl}' style='width: 100%;min-height:-webkit-fill-available;' />");
            }
        }

           

        }
}