namespace Falcon.Web.Models.Api.Purchase
{
    public class SQuestPurchase : IPurchase<SQuestion[]>
    {
        private SQuestion[] mContents;
        private bool mPurchase;
        private int mTotalCoin;

        public SQuestion[] Contents
        {
            get
            {
                return mContents;
            }

            set
            {
                mContents = value;
            }
        }
       
        public bool Purchased
        {
            get
            {
                return mPurchase;
            }

            set
            {
                mPurchase = value;
            }
        }

        public int TotalCoin
        {
            get
            {
                return mTotalCoin;
            }

            set
            {
                mTotalCoin = value; 
            }
        }
    }
}
