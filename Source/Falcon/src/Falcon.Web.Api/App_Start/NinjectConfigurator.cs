﻿// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Security;
using Falcon.Common.Serialization;
using Falcon.Data.QueryProcessors;
using Falcon.Database.SqlServer.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Api.App_Start;
using Falcon.Web.Api.InMemory.Private;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.InquiryProcessing.Private;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.JobSystem.Private;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.MaintenanceProcessing.Private;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Notification.Private;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Api.PurchaseAuthorizer.Private;
using Falcon.Web.Api.PurchaseAuthorizer.Public;
using Falcon.Web.Api.Security.Private;
using Falcon.Web.Api.Security.Public;
using Falcon.Web.Api.Telegram.Private;
using Falcon.Web.Api.Telegram.Public;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Api.Utilities.Mail;
using Falcon.Web.Api.Utilities.RestClient.Engine;
using Falcon.Web.Api.WatchAd.Private;
using Falcon.Web.Api.WatchAd.Public;
using Falcon.Web.Common;
using Falcon.Web.Common.Memmory;
using Falcon.Web.Common.Security;
using Hangfire;
using log4net.Config;
using Ninject;
using Ninject.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;

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
            InMemory(container);
            AddAdHoc(container);

        }
        private void ConfigureHangFire(IKernel container)
        {
            GlobalConfiguration.Configuration.UseNinjectActivator(container);
            GlobalConfiguration.Configuration.UseLog4NetLogProvider();
            GlobalConfiguration.Configuration.UseSqlServerStorage(HangFireDatabase);
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

            //container.Bind<ICommentsQueryProcessor>().To<CommentsQueryProcessor>().InRequestScope();
            //container.Bind<ICreatedQuestionsQueryProcessor>().To<CreatedQuestionsQueryProcessor>().InRequestScope();
            container.Bind<IUserQueryProcessor>().To<UserQueryProcessor>().InRequestScope();
            container.Bind<ICodeGiftsQueryProcessor>().To<CodeGiftsQueryProcessor>().InRequestScope();
            //container.Bind<IGiftQueryProcessor>().To<GiftQueryProcessor>().InRequestScope();
            container.Bind<IStoresQueryProcessor>().To<StoresQueryProcessor>().InRequestScope();
            container.Bind<IMarketInfoQueryProcessor>().To<MarketInfoQueryProcessor>().InRequestScope();
            //container.Bind<INotificationsQueryProcessor>().To<NotificationsQueryProcessor>().InRequestScope();
            //container.Bind<IAppAdvertsQueryProcessor>().To<AppAdvertsQueryProcessor>().InRequestScope();
            container.Bind<IWatchAdQueryProcessor>().To<WatchAdQueryProcessor>().InRequestScope();
            //container.Bind<IAchievementQueryProcessor>().To<AchievementQueryProcessor>().InRequestScope();
            //container.Bind<IDWMQueryProcessor>().To<DWMQueryProcessor>().InRequestScope();
            //container.Bind<ISpinWheelQueryProcessor>().To<SpinWheelQueryProcessor>().InRequestScope();
            //container.Bind<ICategoriesQueryProcessor>().To<CategoriesQueryProcessor>().InRequestScope();
            //container.Bind<IThemesQueryProcessor>().To<ThemesQueryProcessor>().InRequestScope();
            //container.Bind<IAvatarsQueryProcessor>().To<AvatarsQueryProcessor>().InRequestScope();
            //container.Bind<IUserStatQueryProcessor>().To<UserStatQueryProcessor>().InRequestScope();
            //container.Bind<ICharacteristicsQueryProcessor>().To<CharacteristicsQueryProcessor>().InRequestScope();
            //container.Bind<IScoringQueryProcessor>().To<ScoringQueryProcessor>().InRequestScope();
            container.Bind<IQuestionsQueryProcessor>().To<QuestionsQueryProcessor>().InRequestScope();
            container.Bind<IAnswerQueryProcessor>().To<AnswerQueryProcessor>().InRequestScope();
            container.Bind<IGameConfigQueryProcessor>().To<GameConfigQueryProcessor>().InRequestScope();
            container.Bind<IQuestionSelectorQueryProcessor>().To<QuestionSelectorQueryProcessor>().InRequestScope();
            container.Bind<IUserInfoQueryProcessor>().To<UserInfoQueryProcessor>().InRequestScope();
            container.Bind<IQuestsQueryProcessor>().To<QuestsQueryProcessor>().InRequestScope();
            container.Bind<IFriendsQueryProcessor>().To<FriendsQueryProcessor>().InRequestScope();
            container.Bind<ILevelQueryProcessor>().To<LevelQueryProcessor>().InRequestScope();
            container.Bind<IQuestionReportQueryProcessor>().To<QuestionReportQueryProcessor>().InRequestScope();
            container.Bind<ISentQueryProcessor>().To<SentQueryProcessor>().InRequestScope();
            container.Bind<IUserQuestAnswerQueryProcessor>().To<UserQuestAnswerQueryProcessor>().InRequestScope();
            container.Bind<IFeedbackQueryProcessor>().To<FeedbackQueryProcessor>().InRequestScope();
            container.Bind<IQuestSnapshotQueryProcessor>().To<QuestSnapshotQueryProcessor>().InRequestScope();
            container.Bind<IQuestQuestionsQueryProcessor>().To<QuestQuestionsQueryProcessor>().InRequestScope();

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
            //container.Bind<INotificationInquiryProcessor>().To<NotificationInquiryProcessor>().InRequestScope();
            container.Bind<IUsersInquiryProcessor>().To<UsersInquiryProcessor>().InRequestScope();
            container.Bind<IStoresInquiryProcessor>().To<StoresInquiryProcessor>().InRequestScope();
            //container.Bind<IAppAdvertsInquiryProcessor>().To<AppAdvertsInquiryProcessor>().InRequestScope();
            //container.Bind<IAchievementInquiryProcessor>().To<AchievementInquiryProcessor>().InRequestScope();
            //container.Bind<IDWMInquiryProcessor>().To<DWMInquiryProcessor>().InRequestScope();
            //container.Bind<ISpinWheelInquiryProcessor>().To<SpinWheelInquiryProcessor>().InRequestScope();
            container.Bind<IThemesInquiryProcessor>().To<ThemesInquiryProcessor>().InRequestScope();
            container.Bind<ICategoriesInquiryProcessor>().To<CategoriesInquiryProcessor>().InRequestScope();
            container.Bind<IAvatarsInquiryProcessor>().To<AvatarsInquiryProcessor>().InRequestScope();
            container.Bind<ICharacteristicsInquiryProcessor>().To<CharacteristicsInquiryProcessor>().InRequestScope();
            //container.Bind<IUserStatsInquiryProcessor>().To<UserStatsInquiryProcessor>().InRequestScope();
            container.Bind<IAnswerInquiryProcessor>().To<AnswerInquiryProcessor>().InRequestScope();
            container.Bind<IQuestionsInquiryProcessor>().To<QuestionsInquiryProcessor>().InRequestScope();
            container.Bind<IUserInfoInquiryProcessor>().To<UserInfoInquiryProcessor>().InRequestScope();
            container.Bind<IQuestsInquiryProcessor>().To<QuestsInquiryProcessor>().InRequestScope();
            container.Bind<IFriendsInquiryProcessor>().To<FriendsInquiryProcessor>().InRequestScope();
            container.Bind<IInitializationInquiryProcessor>().To<InitializationInquiryProcessor>().InRequestScope();
            container.Bind<ILevelInquiryProcessor>().To<LevelInquiryProcessor>().InRequestScope();
            container.Bind<IQuestionReportInquiryProcessor>().To<QuestionReportInquiryProcessor>().InRequestScope();
            container.Bind<ISentInquiryProcessor>().To<SentInquiryProcessor>().InRequestScope();
            container.Bind<IPollingInquiryProcessor>().To<PollingInquiryProcessor>().InRequestScope();
            container.Bind<IFeedbackInquiryProcessor>().To<FeedbackInquiryProcessor>().InRequestScope();
            container.Bind<IServerInquiryProcessor>().To<ServerInquiryProcessor>().InRequestScope();


        }

        private void AddMaintenanceProcessors(IKernel container)
        {
            // add maintenance part separately
            container.Bind<ICodeGiftsMaintenanceProcessor>().To<CodeGiftsMaintenanceProcessor>().InRequestScope();
            container.Bind<IStoresMaintenanceProcessor>().To<StoresMaintenanceProcessor>().InRequestScope();
            container.Bind<IWatchAdMaintenanceProcessor>().To<WatchAdMaintenanceProcessor>().InRequestScope();
            container.Bind<IAppAdvertsMaintenanceProcessor>().To<AppAdvertsMaintenanceProcessor>().InRequestScope();
            //container.Bind<IDWMMaintenanceProcessor>().To<DWMMaintenanceProcessor>().InRequestScope();
            //container.Bind<ISpinWheelMaintenanceProcessor>().To<SpinWheelMaintenanceProcessor>().InRequestScope();
            container.Bind<ICategoriesMaintenanceProcessor>().To<CategoriesMaintenanceProcessor>().InRequestScope();
            container.Bind<IThemesMaintenanceProcessor>().To<ThemesMaintenanceProcessor>().InRequestScope();
            container.Bind<IAvatarsMaintenanceProcessor>().To<AvatarsMaintenanceProcessor>().InRequestScope();
            container.Bind<ICharacteristicsMaintenanceProcessor>().To<CharacteristicsMaintenanceProcessor>().InRequestScope();
            container.Bind<IUserStatsMaintenanceProcessor>().To<UserStatsMaintenanceProcessor>().InRequestScope();
            container.Bind<IUsersMaintenanceProcessor>().To<UsersMaintenanceProcessor>().InRequestScope();
            //container.Bind<IAchievementMaintenanceProcessor>().To<AchievementMaintenanceProcessor>().InRequestScope();
            container.Bind<ICreatedQuestionsMaintenanceProcessor>().To<CreatedQuestionsMaintenanceProcessor>().InRequestScope();
            container.Bind<IAnswerMaintenanceProcessor>().To<AnswerMaintenanceProcessor>().InRequestScope();
            container.Bind<IUserInfoMaintenanceProcessor>().To<UserInfoMaintenanceProcessor>().InRequestScope();
            container.Bind<IQuestsMaintenanceProcessor>().To<QuestsMaintenanceProcessor>().InRequestScope();
            container.Bind<IFriendsMaintenanceProcessor>().To<FriendsMaintenanceProcessor>().InRequestScope();
            container.Bind<IQuestionsMaintenanceProcessor>().To<QuestionsMaintenanceProcessor>().InRequestScope();
            container.Bind<IQuestionReportMaintenanceProcessor>().To<QuestionReportMaintenanceProcessor>().InRequestScope();
            container.Bind<INotificationMaintenanceProcessor>().To<NotificationMaintenanceProcessor>().InRequestScope();
            container.Bind<ISentMaintenanceProcessor>().To<SentMaintenanceProcessor>().InRequestScope();
            container.Bind<IFeedbackMaintenanceProcessor>().To<FeedbackMaintenanceProcessor>().InRequestScope();
            container.Bind<ITelegramMaintenanceProcessor>().To<TelegramMaintenanceProcessor>().InRequestScope();


        }

        private void InMemory(IKernel container)
        {
            //Quest Data in Memory -> should update whenever data is changed in database 
            container.Bind<IQuestAndLevelInMemory>().To<QuestAndLevelInMemory>().InSingletonScope();

            //Report In Memory
            container.Bind<IReportInMemory>().To<ReportInMemory>().InSingletonScope();

            //UsersCommonData
            container.Bind<IUsersInMemory>().To<UsersInMemory>().InSingletonScope();

            //Telegram Data From Database
            container.Bind<ITelegramConfigurationInMemory>().To<TelegramConfigurationInMemory>().InSingletonScope();

            //Question Notification Configuration
            container.Bind<IQuestionNotifyConfigInMemory>().To<QuestionNotifyConfigInMemory>().InSingletonScope();


        }

        private void AddAdHoc(IKernel container)
        {
            container.Bind<IMarketVerificationProcessor>().To<MarketVerificationProcessor>().InRequestScope();
            container.Bind<IMarketManager>().To<MarketManager>().InRequestScope();
            container.Bind<IWatchAdValidator>().To<WatchAdValidator>().InRequestScope();
            container.Bind<IWatchAdManager>().To<WatchAdManager>().InRequestScope(); //handling watch ad validator



            //telegram manager
            //container.Bind<ITelegramManager>().To<TelegramManager>().InRequestScope();

            container.Bind<IDateTime>().To<DateTimeAdapter>().InSingletonScope();
            container.Bind<IJsonManager>().To<JsonManager>().InSingletonScope();


            container.Bind<IBasicPrincipalSecurityService>().To<BasicPrincipalSecurityService>().InSingletonScope();

            //Global Application State
            container.Bind<IGlobalApplicationState>().To<GlobalApplicationState>().InSingletonScope();
            container.Bind<IClientApplicationState>().To<ClientApplicationState>().InSingletonScope();

            //Game Configuration 
            container.Bind<IGameConfig>().To<GameConfig>().InSingletonScope();

            //
            container.Bind<IItemPurchaseManager>().To<ItemPurchaseManager>().InRequestScope();

            //Encryption
            container.Bind<IEncryptor>().To<NumberEncryptor>().InSingletonScope();

            //Random
            container.Bind<IRandomGenerator>().To<RandomGeneratorAdapter>().InSingletonScope();

            //Mail Service 
            container.Bind<IMailManager>().To<MailManager>().InSingletonScope();

            //Job Manager
            container.Bind<IJobManager>().To<JobManager>().InSingletonScope();

            //Temp Memory
            container.Bind<IMemoryStore>().To<MemeoryStore>().InSingletonScope();

            //NetworkUtils
            container.Bind<INetworkUtils>().To<NetworkUtils>().InSingletonScope();

            //UUIDGenerator
            container.Bind<IUUIDGenerator>().To<UUIDGenerator>().InSingletonScope();

            //NotificationSystem
            container.Bind<INotificationSystem>().To<NotificationSystem>().InSingletonScope();

            //Notification Data
            container.Bind<INotificationData>().To<NotificationData>().InSingletonScope();

            container.Bind<ITelegramService>().To<TelegramService>().InSingletonScope();

            //Rest Client
            //var rest = new RestClient();
            //container.Bind<IRestClient>().ToConstant(rest).InSingletonScope();
            container.Bind<IRestClientEngine>().To<RestClientEngine>().InSingletonScope();


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

    }
}