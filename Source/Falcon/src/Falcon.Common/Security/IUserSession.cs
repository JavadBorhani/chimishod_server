// Flapp Copyright 2017-2018


namespace Falcon.Common.Security
{
    public interface IUserSession
    {
        string UUID { get; }
        int ID { get; }
        string UserName { get; }
        string ImageUrl { get; }
        //DateTime LastSeenDateTime { get; }
        //DateTime PrevLastSeenDateTime { get; }
        //bool IsTutorial { get;}
    }
}
