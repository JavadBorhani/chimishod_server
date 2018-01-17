// Flapp Copyright 2017-2018

using Ninject;
using System;
using System.Collections.Generic;
using System.Web.Http.Dependencies;

namespace Falcon.Web.Common
{
    public sealed class NinjectDependencyResolver : IDependencyResolver
    {
        private readonly IKernel mContainer;

        public NinjectDependencyResolver(IKernel container)
        {
            mContainer = container;
        }

        public IKernel Container
        {
            get { return mContainer;  }
        }

        public IDependencyScope BeginScope()
        {
            return this; 
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this); 
        }

        public object GetService(Type serviceType)
        {
            var item = mContainer.TryGet(serviceType);
            return item;
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            return mContainer.GetAll(serviceType);
        }
    }
}
