using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Hosting;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    public class ImageController : FalconApiController
    {

        private IUserSession mUserSession;
        private readonly IUsersMaintenanceProcessor mUserMaintenance;
        public ImageController(IUserSession Session, IUsersMaintenanceProcessor UsersMaintenance)
        {
            mUserSession = Session;
            mUserMaintenance = UsersMaintenance;
        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Image/")]
        [HttpPost]
        public async Task<IHttpActionResult> UploadProfilePicture()
        {
            if (Request.Content.IsMimeMultipartContent())
            {
                int maxLength = 3 * 1024 * 1024;

                int result = mUserSession.ID;
                var badRequest = false;

                await Request.Content.ReadAsMultipartAsync(new MultipartMemoryStreamProvider()).ContinueWith((task) =>
                {

                    MultipartMemoryStreamProvider provider = task.Result;
                    //if (provider.Contents.Count > 1)
                    //    return;

                    foreach (HttpContent content in provider.Contents)
                    {
                        if (content.Headers.ContentLength > maxLength)
                        {
                            badRequest = true;
                            break;
                        }
                        Stream stream = content.ReadAsStreamAsync().Result;
                        Image image = Image.FromStream(stream);
                        var testName = content.Headers.ContentDisposition.Name;
                        string filePath = HostingEnvironment.MapPath("~" + Constants.ServerVariables.ImageUploadLocation);
                        
                        string fileName = result + ".jpg";
                        string fullPath = Path.Combine(filePath, fileName);
                        image.Save(fullPath);

                        
                    }

                });

                if(badRequest)
                {
                    return BadRequest("image size can't be bigger than 70kb");
                }
                else
                {
                    var amount = await mUserMaintenance.SaveImageUrl(Constants.ServerVariables.ImageUploadLocation + mUserSession.ID + ".jpg");
                    return Ok(true);
                }
               
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotAcceptable, "This request is not properly formatted"));
            }
        }
    }
}
