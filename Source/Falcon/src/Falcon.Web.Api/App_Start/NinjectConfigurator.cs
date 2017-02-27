// Flapp Copyright 2017-2018

using Falcon.Common.Logging;
using Falcon.Common;
using log4net.Config;
using Ninject;
using Falcon.Web.Common;
using Ninject.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Common.Security;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Database.SqlServer.QueryProcessors;
using System;
using System.Linq;
using AutoMapper;
using System.Collections.Generic;
using Falcon.Web.Api.App_Start;

namespace Falcon.Web.Api
{
    public class NinjectConfigurator
    {
        private const string DatabaseConnectionName = "name=DbEntity";
        public void Configure(IKernel container)
        {
            AddBindings(container);
            
        }
        
        private void AddBindings(IKernel container)
        {
            ConfigureUserSession(container);
            ConfigureEntityFramework(container);
            ConfigureLog4Net(container);
            ConfigureAutoMapper(container);
            AddQueryProcessors(container);

            container.Bind<IDateTime>().To<DateTimeAdapter>().InSingletonScope();


        }
        private void ConfigureLog4Net(IKernel container)
        {
            XmlConfigurator.Configure();

            var logManager = new LogManagerAdapter();

            container.Bind<ILogManager>().ToConstant(logManager);
        }

        private void ConfigureUserSession(IKernel container)
        {
            var userSession = new UserSession();
            container.Bind<IUserSession>().ToConstant(userSession).InSingletonScope();
            container.Bind<IWebUserSession>().ToConstant(userSession).InSingletonScope();
        }
        private void ConfigureEntityFramework(IKernel container)
        {
            var ContextFactory = WebContextModelFactory.BuildSqlServer2012Factory(DatabaseConnectionName);
            container.Bind<IWebContextFactory>().ToConstant(ContextFactory);

            container.Bind<IDbContext>().ToMethod(context => context.Kernel.Get<IWebContextFactory>().GetNewOrCurrentContext());
            container.Bind<IActionTransactionHelper>().To<ActionTransactionHelper>().InRequestScope();
        }

        private void AddQueryProcessors(IKernel container)
        {
            container.Bind<IAchievementQueryProcessor>().To<AchievementQueryProcessor>().InRequestScope();
        }

        private void ConfigureAutoMapper(IKernel container)
        {


            var result = AppDomain.CurrentDomain.GetAssemblies()
                                                .Where(r => r.FullName.Contains("Falcon"))
                                                .Select(r => r.GetTypes());

            List<Profile> profiles = new List<Profile>();
            foreach(var m in result)
            {
                for(int i = 0; i< m.Length; ++i)
                {
                    if (m[i].IsSubclassOf(typeof(Profile)))
                        profiles.Add((Profile)Activator.CreateInstance(m[i]));
                }
            }
            new AutoMapperConfiguration().Configure(profiles, container); 
        }

    }
}