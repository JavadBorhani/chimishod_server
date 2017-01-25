using Falcon.Common.Logging;
using Falcon.Common;
using log4net.Config;
using Ninject;
using Falcon.Web.Common;
using Ninject.Web.Common;

namespace Falcon.Web.Api
{
    public class NinjectConfigurator
    {
        public void Configure(IKernel container)
        {
            AddBindings(container);
            ConfigureEntityFramework(container);
        }
        
        private void AddBindings(IKernel container)
        {
            ConfigureLog4Net(container);

            container.Bind<IDateTime>().To<DateTimeAdapter>().InSingletonScope();

        }
        private void ConfigureLog4Net(IKernel container)
        {
            XmlConfigurator.Configure();

            var logManager = new LogManagerAdapter();

            container.Bind<ILogManager>().ToConstant(logManager);
        }
        private void ConfigureEntityFramework(IKernel container)
        {
            container.Bind<IActionTransactionHelper>().To<ActionTransactionHelper>().InRequestScope();
        }

    }
}