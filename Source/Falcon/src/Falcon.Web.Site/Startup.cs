using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Falcon.Web.Site.Startup))]
namespace Falcon.Web.Site
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
