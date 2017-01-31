
using AutoMapper;
using Falcon.Web.Common;
using Ninject;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.App_Start
{
    public class AutoMapperConfiguration
    {
        public void Configure(IEnumerable<Profile> profiles , IKernel container)
        {

            var config = new MapperConfiguration(
                c =>
                {
                    foreach (var profile in profiles)
                    {
                        c.AddProfile(profile);
                    }
                });

            config.AssertConfigurationIsValid();

            // Solution starts here
            var mapper = config.CreateMapper(); 
            container.Bind<IMapper>().ToConstant(mapper);
        }
    }
}