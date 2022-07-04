using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PersonalCabinetAPI.DTO;
using PersonalCabinetAPI.Service;

[ApiController]
[Route("/v1/transactions")]
[EnableCors()]
public class ApiController : ControllerBase
{
    private readonly IOperationService _opservice;
    private readonly IAccountService _acservice;

    public ApiController(IOperationService opservice, IAccountService acservice)
    {
        _opservice = opservice;
        _acservice = acservice;
    }

    [HttpPost("by_doc_number/")]
    public async Task<IEnumerable<Entry>> GetByDocNumber(Request req)
    {
        Thread.Sleep(5000);
        var operations = await _opservice.GetEntriesByDocNumberTransaction(req.number);
        return operations;
    }
    
    [HttpPost("by_ticket_number/")]
    public async Task<IEnumerable<Entry>> GetByTicketNumber(Request req)
    {
        Thread.Sleep(5000);
        return await _opservice.GetEntriesByTicketNumberTransaction(req);
    }

    [HttpPost("operations_by_airline_code_doc_number")]
    public async Task<IEnumerable<Operation>> GetOperationsByAirlineCodeDocNumber(AirlineRequest req)
    {
        Thread.Sleep(5000);
        return await _opservice.GetOperationsByAirlineCodeDocNumber(req.code, req.number);
    }
    
    [HttpPost("operations_by_airline_code_ticket_number")]
    public async Task<IEnumerable<Operation>> GetOperationsByAirlineCodeTicketNumber(AirlineRequest req)
    {
        Thread.Sleep(5000);
        return await _opservice.GetOperationsByAirlineCodeTicketNumber(req);
    }

    [HttpPost("login")]
    public async Task<ActionResult> Login(Account account)
    {
        var result = await _acservice.LoginTransaction(account);
        if (!result) return new BadRequestResult();
        return new OkResult();
    }
    
    [HttpPost("register")]
    public async Task<ActionResult> Register(Account account)
    {
        var result = await _acservice.RegisterTransaction(account);
        if (!result) return new BadRequestResult();
        return new OkResult();
    }
}
