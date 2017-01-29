// BMS-Studio Copyright 2017-2018

using System;
using System.Net.Http;
using log4net;
using Falcon.Common.Logging;
using System.Web.Http.Tracing;

namespace Falcon.Web.Common
{
    
    public class SimpleTraceWriter : ITraceWriter
    {
        private readonly ILog mLog;

        public SimpleTraceWriter(ILogManager logMananger)
        {
            mLog = logMananger.GetLog(typeof(SimpleTraceWriter));
        }

        public void Trace(HttpRequestMessage request, string category, TraceLevel level, Action<TraceRecord> traceAction)
        {
            var rec = new TraceRecord(request, category, level);
            traceAction(rec);
            WriteTrace(rec);
        }
        public void WriteTrace(TraceRecord rec)
        {
            const string traceFormat = "RequestId={0};{1}kind={2};{3}Status={4};{5}Operation={6};{7}Operator={8};{9}Category={10}{11}Request={12}{13}Message={14}";
            var args = new object[]
            {
                rec.RequestId,
                Environment.NewLine,
                rec.Kind,
                Environment.NewLine,
                rec.Status,
                Environment.NewLine,
                rec.Operation,
                Environment.NewLine,
                rec.Category,
                Environment.NewLine,
                rec.Request,
                Environment.NewLine,
                rec.Message
            };

            switch(rec.Level)
            {
                case TraceLevel.Debug:

                    mLog.DebugFormat(traceFormat, args);
                    break;

                case TraceLevel.Info:

                    mLog.InfoFormat(traceFormat, args);
                    break;
                case TraceLevel.Warn:

                    mLog.WarnFormat(traceFormat, args);
                    break;

                case TraceLevel.Error:

                    mLog.ErrorFormat(traceFormat, args); 
                    break;

                case TraceLevel.Fatal:

                    mLog.FatalFormat(traceFormat, args);
                    break; 
            }
        }
    }
}
