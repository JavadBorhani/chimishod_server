using System;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Falcon.Web.Api.Utilities
{
    public class ImageStreamProvider : MultipartFormDataStreamProvider
    {
        
        public ImageStreamProvider(string UploadPath): base(UploadPath)
        {

        }

        public override string GetLocalFileName(HttpContentHeaders headers)
        {
            string fileName = headers.ContentDisposition.Name;

            if(string.IsNullOrEmpty(fileName))
            {
                fileName = Guid.NewGuid().ToString() + ".jpg";
            }

            return fileName.Replace("\"", string.Empty);
        }
    }
}