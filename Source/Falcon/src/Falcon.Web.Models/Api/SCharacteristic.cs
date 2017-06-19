using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SCharacteristic
    {
        public class CharacterAlias
        {
            public string Title { get; set; }
            public string Icon { get; set; }
        }


        public int ID { get; set; }
        public string Title { get; set; }
        public ICollection<CharacterAlias> Alias { get; set; }
        public string Icon { get; set; }
        public int UserCount { get; set; }
    }
}
