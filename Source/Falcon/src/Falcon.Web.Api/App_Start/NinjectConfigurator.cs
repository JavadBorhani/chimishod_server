// BMS-Studio Copyright 2017-2018

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

namespace Falcon.Web.Api
{
    public class NinjectConfigurator
    {
        private const string DatabaseConnectionName = "name=DbEntity";
        public void Configure(IKernel container)
        {
            AddBindings(container);
            ConfigureUserSession(container);
            ConfigureEntityFramework(container);
        }
        
        private void AddBindings(IKernel container)
        {
            ConfigureLog4Net(container);

            container.Bind<IDateTime>().To<DateTimeAdapter>().InSingletonScope();

            AddQueryProcessors(container);


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

    }
}