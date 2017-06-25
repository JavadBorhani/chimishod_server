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
using Falcon.Web.Api.InquiryProcessing.Private;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Security.Public;
using Falcon.Web.Api.Security.Private;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Private;
using Falcon.Common.Serialization;
using Falcon.Web.Api.PurchaseAuthorizer.Public;
using Falcon.Web.Api.PurchaseAuthorizer.Private;
using Falcon.Web.Api.WatchAd.Public;
using Falcon.Web.Api.WatchAd.Private;
using Hangfire;
using Owin;
using System.Data.Entity.Core.EntityClient;
using Falcon.Web.Api.Controllers;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.JobSystem.Private;
using Falcon.Web.Api.JobSystem.Private.Jobs;
using Hangfire.Storage;

namespace Falcon.Web.Api
{
    public class NinjectConfigurator
    {
        private const string DatabaseConnectionName = "name=DbEntity";
        private const string HangFireDatabase = "HangFire";
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
            ConfigureHangFire(container);
            AddQueryProcessors(container);
            AddInquiryProcessors(container);
            AddMaintenanceProcessors(container);
            AddAdHoc(container);
            StartJobs();
        }
        private void ConfigureHangFire(IKernel container)
        {
            GlobalConfiguration.Configuration.UseNinjectActivator(container);
            GlobalConfiguration.Configuration.UseLog4NetLogProvider();

            GlobalConfiguration.Configuration.UseSqlServerStorage(HangFireDatabase);

            //container.Bind<IDbContext>().ToSelf().InBackgroundJobScope();

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

            container.Bind<ICommentsQueryProcessor>().To<CommentsQueryProcessor>().InRequestScope();
            container.Bind<ICreatedQuestionsQueryProcessor>().To<CreatedQuestionsQueryProcessor>().InRequestScope();
            container.Bind<IUserQueryProcessor>().To<UserQueryProcessor>().InRequestScope();
            container.Bind<ICodeGiftsQueryProcessor>().To<CodeGiftsQueryProcessor>().InRequestScope();
            container.Bind<IGiftQueryProcessor>().To<GiftQueryProcessor>().InRequestScope();
            container.Bind<IStoresQueryProcessor>().To<StoresQueryProcessor>().InRequestScope();
            container.Bind<IMarketInfoQueryProcessor>().To<MarketInfoQueryProcessor>().InRequestScope();
            container.Bind<INotificationsQueryProcessor>().To<NotificationsQueryProcessor>().InRequestScope();
            container.Bind<IAppAdvertsQueryProcessor>().To<AppAdvertsQueryProcessor>().InRequestScope();
            container.Bind<IWatchAdQueryProcessor>().To<WatchAdQueryProcessor>().InRequestScope();
            container.Bind<IAchievementQueryProcessor>().To<AchievementQueryProcessor>().InRequestScope();
            container.Bind<IDWMQueryProcessor>().To<DWMQueryProcessor>().InRequestScope();
            container.Bind<ISpinWheelQueryProcessor>().To<SpinWheelQueryProcessor>().InRequestScope();
            container.Bind<ICategoriesQueryProcessor>().To<CategoriesQueryProcessor>().InRequestScope();
            container.Bind<IThemesQueryProcessor>().To<ThemesQueryProcessor>().InRequestScope();
            container.Bind<IAvatarsQueryProcessor>().To<AvatarsQueryProcessor>().InRequestScope();
            container.Bind<IUserStatQueryProcessor>().To<UserStatQueryProcessor>().InRequestScope();
            container.Bind<ICharacteristicsQueryProcessor>().To<CharacteristicsQueryProcessor>().InRequestScope();


            //summary: Reusing an special Component With Background Process and Http In RequestScope
            //container.Bind<IUserStatQueryProcessor>()
            //    .ToSelf()
            //    .InNamedOrBackgroundJobScope(context => context.Kernel.Components.GetAll<INinjectHttpApplicationPlugin>()
            //                                        .Select(c => c.GetRequestScope(context))
            //                                        .FirstOrDefault(s => s != null));

        }

        private void AddInquiryProcessors(IKernel container)
        {
            container.Bind<IPagedDataRequestFactory>().To<PagedDataRequestFactory>().InSingletonScope();
            container.Bind<ICommentsInquiryProcessor>().To<CommentsInquiryProcessor>().InRequestScope();
            container.Bind<ICreatedQuestionsInquiryProcessor>().To<CreatedQuestionsInquiryProcessor>().InRequestScope();
            container.Bind<INotificationInquiryProcessor>().To<NotificationInquiryProcessor>().InRequestScope();
            container.Bind<IUsersInquiryProcessor>().To<UsersInquiryProcessor>().InRequestScope();
            container.Bind<IStoresInquiryProcessor>().To<StoresInquiryProcessor>().InRequestScope();
            container.Bind<IAppAdvertsInquiryProcessor>().To<AppAdvertsInquiryProcessor>().InRequestScope();
            container.Bind<IAchievementInquiryProcessor>().To<AchievementInquiryProcessor>().InRequestScope();
            container.Bind<IDWMInquiryProcessor>().To<DWMInquiryProcessor>().InRequestScope();
            container.Bind<ISpinWheelInquiryProcessor>().To<SpinWheelInquiryProcessor>().InRequestScope();
            container.Bind<IThemesInquiryProcessor>().To<ThemesInquiryProcessor>().InRequestScope();
            container.Bind<ICategoriesInquiryProcessor>().To<CategoriesInquiryProcessor>().InRequestScope();
            container.Bind<IAvatarsInquiryProcessor>().To<AvatarsInquiryProcessor>().InRequestScope();
            container.Bind<ICharacteristicsInquiryProcessor>().To<CharacteristicsInquiryProcessor>().InRequestScope();
            container.Bind<IUserStatsInquiryProcessor>().To<UserStatsInquiryProcessor>().InRequestScope();

        }
        private void  AddMaintenanceProcessors(IKernel container)
        {
            // add maintenance part separately
            container.Bind<ICodeGiftsMaintenanceProcessor>().To<CodeGiftsMaintenanceProcessor>().InRequestScope();
            container.Bind<IStoresMaintenanceProcessor>().To<StoresMaintenanceProcessor>().InRequestScope();
            container.Bind<IWatchAdMaintenanceProcessor>().To<WatchAdMaintenanceProcessor>().InRequestScope();
            container.Bind<IAppAdvertsMaintenanceProcessor>().To<AppAdvertsMaintenanceProcessor>().InRequestScope();
            container.Bind<IDWMMaintenanceProcessor>().To<DWMMaintenanceProcessor>().InRequestScope();
            container.Bind<ISpinWheelMaintenanceProcessor>().To<SpinWheelMaintenanceProcessor>().InRequestScope();
            container.Bind<ICategoriesMaintenanceProcessor>().To<CategoriesMaintenanceProcessor>().InRequestScope();
            container.Bind<IThemesMaintenanceProcessor>().To<ThemesMaintenanceProcessor>().InRequestScope();
            container.Bind<IAvatarsMaintenanceProcessor>().To<AvatarsMaintenanceProcessor>().InRequestScope();
            container.Bind<ICharacteristicsMaintenanceProcessor>().To<CharacteristicsMaintenanceProcessor>().InRequestScope();

        }

        private void AddAdHoc(IKernel container)
        {
            container.Bind<IMarketVerificationProcessor>().To<MarketVerificationProcessor>().InRequestScope();
            container.Bind<IMarketManager>().To<MarketManager>().InRequestScope();
            container.Bind<IWatchAdValidator>().To<WatchAdValidator>().InRequestScope();

            container.Bind<IDateTime>().To<DateTimeAdapter>().InSingletonScope();
            container.Bind<IJsonManager>().To<JsonManager>().InSingletonScope();


            container.Bind<IBasicPrincipalSecurityService>().To<BasicPrincipalSecurityService>().InSingletonScope();

            //Global Application State
            container.Bind<IGlobalApplicationState>().To<GlobalApplicationState>().InSingletonScope();


            container.Bind<IItemPurchaseManager>().To<ItemPurchaseManager>().InRequestScope();

            //Encryption
            container.Bind<IEncryptor>().To<NumberEncryptor>().InSingletonScope();

            //Random
            container.Bind<IRandomGenerator>().To<RandomGeneratorAdapter>().InSingletonScope();

            //Mail Service 
            container.Bind<IMailManager>().To<MailManager>().InSingletonScope();

            //Job Manager
            container.Bind<IJobManager>().To<JobManager>().InSingletonScope();
        }

        private void ConfigureAutoMapper(IKernel container)
        {

            var result = AppDomain.CurrentDomain.GetAssemblies()
                                                .Where(r => r.FullName.Contains("Falcon")) //TODO : think about a better design
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
        private void StartJobs()
        {
            using (var connection = JobStorage.Current.GetConnection())
            {
                foreach (var item in connection.GetRecurringJobs())
                {
                    RecurringJob.RemoveIfExists(item.Id);
                }
            }
        }

    }
}