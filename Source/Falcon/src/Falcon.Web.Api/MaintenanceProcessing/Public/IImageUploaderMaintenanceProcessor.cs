using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IImageUploaderMaintenanceProcessor
    {
        Task<bool> UploadImage();
    }
}