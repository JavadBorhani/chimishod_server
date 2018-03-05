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

        private readonly IUserSession mUserSession;
        private readonly IUsersMaintenanceProcessor mUserMaintenance;
        private readonly IUsersInMemory mUsersInMemory;
        private readonly IUUIDGenerator mGenerator;

        public ImageController(
            IUserSession Session, 
            IUsersMaintenanceProcessor UsersMaintenance , 
            IUsersInMemory UsersInMemory , 
            IUUIDGenerator Generator)
        {
            mUserSession = Session;
            mUserMaintenance = UsersMaintenance;
            mUsersInMemory = UsersInMemory;
            mGenerator = Generator;
        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Image/")]
        [HttpPost]
        public async Task<IHttpActionResult> UploadProfilePicture()
        {
            if (Request.Content.IsMimeMultipartContent())
            {
                int maxLength = 100 * 1024;

                var result = mGenerator.GetNewUUID();
                var badRequest = false;
                var finished = false;

                await Request.Content.ReadAsMultipartAsync(new MultipartMemoryStreamProvider()).ContinueWith((task) =>
                {

                    MultipartMemoryStreamProvider provider = task.Result;
                    if (provider.Contents.Count > 1)
                        return;

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

                        if(File.Exists(fullPath))
                        {
                            finished = true;
                        }
                        else
                        {
                            finished = false;
                        }
                    }

                });

                if(badRequest || !finished)
                {
                    return BadRequest("image size can't be bigger than 100kb");
                }
                else
                {

                    var path = Constants.ServerVariables.ImageUploadLocation + result + ".jpg";
                    var amount = await mUserMaintenance.SaveImageUrl(path);
                    mUsersInMemory.UpdateImagePath(mUserSession.ID, path);
                    return Ok(path);

                }
               
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotAcceptable, "This request is not properly formatted"));
            }
        }

    }
}
