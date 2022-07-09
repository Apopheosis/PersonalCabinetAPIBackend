using System;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

public class ExceptionMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger _logger;

    public ExceptionMiddleware(RequestDelegate next, ILoggerFactory loggerFactory)
    {
        _next = next;
        _logger = loggerFactory.CreateLogger<ExceptionMiddleware>();
    }

    public async Task Invoke(HttpContext httpContext, ILogger<ExceptionMiddleware> logger)
    {
        try
        {
            
            await _next(httpContext);
        }
        catch (OperationNotFoundByTicketNumberException)
        {
            httpContext.Response.StatusCode = 404;
            httpContext.Response.ContentType = "application/json";
            var error = new ErrorDetails()
            {
                StatusCode = 404,
                Message = "Не найдены операции с этим номером билета."
            };
            await httpContext.Response.WriteAsync(error.ToString());
            _logger.LogError($"{error.StatusCode} {error.Message}");
        }
        catch (OperationNotFoundByDocNumberException)
        {
            httpContext.Response.StatusCode = 404;
            httpContext.Response.ContentType = "application/json";
            var error = new ErrorDetails()
            {
                StatusCode = 404,
                Message = "Не найдены операции с этим номером документа."
            };
            await httpContext.Response.WriteAsync(error.ToString());
            _logger.LogError($"{error.StatusCode} status code: {error.Message}");
        }
        finally
        {
            DateTime datetime = DateTime.Now;
            var datetimestring =
                $"{datetime.Day}/{datetime.Month}/{datetime.Year} {datetime.Hour}:{datetime.Minute}:{datetime.Second}:{datetime.Millisecond}";
            _logger.LogInformation("Request №{id}: {datetime} {method} {url} => {statusCode}", httpContext.TraceIdentifier, datetimestring, 
                httpContext.Request.Method, httpContext.Request.Path.Value, httpContext.Response.StatusCode);
        }
        
    }
}

public class ErrorDetails
{
    public int StatusCode { get; set; }
    public string Message { get; set; }
    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }
}