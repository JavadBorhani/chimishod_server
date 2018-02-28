using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class ImageUploaderMaintenanceProcessor : IImageUploaderMaintenanceProcessor
    {

        
        public ImageUploaderMaintenanceProcessor()
        {

        }
        public async Task<bool> UploadImage()
        {
            throw new NotImplementedException();
        }
    }
}