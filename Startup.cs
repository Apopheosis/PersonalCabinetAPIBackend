using System;
using System.IO;
using System.Net;
using System.Net.Mime;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Middleware;
using PersonalCabinetAPI;
using PersonalCabinetAPI.Service;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddAutoMapper(typeof(Startup));
            services.AddRouting(options => options.LowercaseUrls = true);
            Console.WriteLine(Configuration.GetConnectionString("DatabaseContext"));
            services.AddDbContext<DatabaseContext>(options =>
                options.UseNpgsql(Configuration.GetConnectionString("DatabaseContext")));
            services.AddScoped<IOperationService, OperationService>();
            services.AddScoped<IAccountService, AccountService>();
            services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.ForwardedHeaders =
                    ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
                options.KnownProxies.Add(IPAddress.Parse("10.0.0.100"));
            });


        }
        
        

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            app.UseForwardedHeaders();
            //app.UseMiddleware<RequestLogMiddleware>();
            if(env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.Use(next => context =>
            {
                context.Request.EnableBuffering();
                return next(context);
            });
            
            app.Use(next => context =>
            {
                context.Request.EnableBuffering();
                return next(context);
            });
            
            app.UseRouting();
            app.UseCors(options =>
            {
                options.AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowAnyOrigin()
                    .Build();
            });
            app.UseHsts();
            app.UseHttpsRedirection();
            
            app.UseExceptionMiddleware();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
            
        }
    }