using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public enum AchievedScoreType
    {
        Achievement = 1,
        Liked = 2,
        Answer = 3,
    }
    public interface IScoringQueryProcessor
    {
        Task<int> AddScore(int UserID , int Amount, AchievedScoreType ScoreType);
    }
}
