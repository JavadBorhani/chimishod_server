using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.SpinWheelMap
{
    using Common;
    using Models.Api;
    using Security.Public;

    public class SpinWheelToSSpinWheelAutoTypeConfiguration : Profile
    {
        public SpinWheelToSSpinWheelAutoTypeConfiguration()
        {
            CreateMap<SpinWheel, SSpinWheel>()
                .ForMember(ss => ss.ID, m => m.ResolveUsing(sw =>
                {                    
                    return Encryptor.EncryptInt(sw.ID);
                }))
                .ForMember(ss => ss.Title, m => m.ResolveUsing(sw =>
                {
                    return Encryptor.EncryptString(sw.Title);
                }))
                .ForMember(ss => ss.Icon, m => m.MapFrom(sw => sw.Icon))
                .ForMember(ss => ss.SpinWheelType, m => m.ResolveUsing(sw =>
                {
                    bool isPossible = Enum.IsDefined(typeof(SSpinWheelType), sw.SpinWheelType.Title);
                    if(isPossible)
                    {
                        var result = (int)(SSpinWheelType)Enum.Parse(typeof(SSpinWheelType), sw.SpinWheelType.Title);
                        return result;
                    }
                    return 0;                    
                }))
                .ForMember(ss => ss.Prize, m => m.ResolveUsing(sw =>
                {
                    return Encryptor.EncryptInt(sw.Prize);
                }))
                .ForMember(ss => ss.SpinWheelAlternativeID, m => m.MapFrom(sw => sw.SpinWheelAlternativeID))
                .ForMember(ss => ss.FirstChance, m => m.ResolveUsing(sw =>
                {
                    return Encryptor.EncryptDouble((float)sw.FirstChance);
                }))
                .ForMember(ss => ss.SecondChance, m => m.ResolveUsing(sw =>
                {
                    return Encryptor.EncryptDouble((float)sw.SecondChance , true);
                }))
                .ForMember(ss => ss.Priority, m => m.MapFrom(sw => sw.Priority));
        }

        private IEncryptor Encryptor
        {
            get
            {
                return WebContainerManager.Get<IEncryptor>();
            }
        }

    }
}