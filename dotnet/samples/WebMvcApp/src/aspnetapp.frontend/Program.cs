using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace aspnetapp.frontend
{
    public sealed class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                //https://github.com/aspnet/AspNetCore/issues/9704#issuecomment-508273542
                .UseContentRoot(Path.GetDirectoryName(typeof(Program).Assembly.Location))
                .UseStartup<Startup>();
    }
}
