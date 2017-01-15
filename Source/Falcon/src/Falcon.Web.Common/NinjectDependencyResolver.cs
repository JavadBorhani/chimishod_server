﻿using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http.Dependencies;

namespace Falcon.Web.Common
{
    public class NinjectDependencyResolver : IDependencyResolver
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
            return mContainer.TryGet(serviceType); 
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            return mContainer.GetAll(serviceType);
        }
    }
}