using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Vision.V1;
using Grpc.Auth;
using Google.Apis.Auth.OAuth2;

public partial class Default2 : System.Web.UI.Page
{
    public static string annotationtext = "---";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Authenticate to the service by using Service Account
        var credential = GoogleCredential.FromFile(@"D:\HTWebsite\App_Data\ApiKeyGemachVision.json").CreateScoped(ImageAnnotatorClient.DefaultScopes);
        var channel = new Grpc.Core.Channel(ImageAnnotatorClient.DefaultEndpoint.ToString(), credential.ToChannelCredentials());
            
        //string credential_path = @"D:\HTWebsite\App_Data\ApiKeyGemachVision.json";
        //System.Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", credential_path);
        
        // Instantiates a client
        var client = ImageAnnotatorClient.Create();
        // Load the image file into memory
        var image = Google.Cloud.Vision.V1.Image.FromFile("images/2019_01_22_22_42_30.png");
        // Performs label detection on the image file
        var response = client.DetectLabels(image);
        foreach (var annotation in response)
        {
            if (annotation.Description != null)
            {
                Console.WriteLine(annotation.Description);
                annotationtext += annotation.Description+"<br>";
            }
        }
    }
}