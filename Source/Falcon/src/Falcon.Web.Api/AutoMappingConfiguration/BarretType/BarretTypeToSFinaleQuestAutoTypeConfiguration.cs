using AutoMapper;
using Falcon.Common.Extentions;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Api.AutoMappingConfiguration.BarretType
{
    using EFCommonContext.DbModel;


    public class BarretTypeToSFinaleQuestAutoTypeConfiguration : Profile
    {
        public BarretTypeToSFinaleQuestAutoTypeConfiguration()
        {
            CreateMap<BarrettType, SFinaleQuest>()
                .ForMember(s => s.ID , m => m.MapFrom(u => u.ID))
                .ForMember(s => s.Title , m => m.MapFrom(u => u.Name))
                .ForMember(s => s.Description, m => m.ResolveUsing(s =>
                {
                    var splitter = s.Description.Lines(s.Separator);

                    FinaleDescription[] description = new FinaleDescription[splitter.Length / 2];

                    for (int i = 0 , j = 0 ; i < description.Length; i++ , j = j + 2 )
                    {
                        description[i] = new FinaleDescription
                        {
                            Title = splitter[j].Trim(),
                            Description = splitter[j + 1].Trim()
                        };
                    }

                    return description;

                }));            
        }
    }
}