using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace hfiles
{
    public partial class captchacode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random random = new Random();
            string captchaText = "";
            for (int i = 0; i < 5; i++) // 5 characters long
            {
                captchaText += (char)random.Next(65, 90); // A-Z characters
            }

            // Store the CAPTCHA text in Session for verification later
            Session["Captcha"] = captchaText;

            // Create a bitmap for the CAPTCHA image
            Bitmap bitmap = new Bitmap(150, 50);
            Graphics g = Graphics.FromImage(bitmap);

            // Set background color and clear the image
            g.Clear(Color.White);

            // Draw random lines for obfuscation
            for (int i = 0; i < 5; i++) // Draw 5 random lines
            {
                Pen pen = new Pen(Color.FromArgb(random.Next(256), random.Next(256), random.Next(256)));
                g.DrawLine(pen, random.Next(0, bitmap.Width), random.Next(0, bitmap.Height), random.Next(0, bitmap.Width), random.Next(0, bitmap.Height));
            }

            // Draw the CAPTCHA text
            Font font = new Font("Arial", 20, FontStyle.Bold);
            Brush brush = new SolidBrush(Color.Black);
            g.DrawString(captchaText, font, brush, 10, 10);

            // Add noise (random dots)
            for (int i = 0; i < 100; i++) // 100 random dots
            {
                bitmap.SetPixel(random.Next(bitmap.Width), random.Next(bitmap.Height), Color.FromArgb(random.Next(256), random.Next(256), random.Next(256)));
            }

            // Render the CAPTCHA image to the response stream
            Response.ContentType = "image/png";
            bitmap.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);

            // Clean up resources
            g.Dispose();
            bitmap.Dispose();
        }
    }
}