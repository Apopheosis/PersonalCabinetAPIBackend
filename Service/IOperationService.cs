using System.Collections.Generic;
using System.Threading.Tasks;
using PersonalCabinetAPI.DTO;

namespace PersonalCabinetAPI.Service
{
    public interface IOperationService
    {
        Task<IEnumerable<Entry>> GetEntriesByDocNumberTransaction(string number);
        Task<IEnumerable<Entry>> GetEntriesByTicketNumberTransaction(Request req);
        Task<IEnumerable<Operation>> GetOperationsByAirlineCodeDocNumber(string code, string number);
        Task<IEnumerable<Operation>> GetOperationsByAirlineCodeTicketNumber(AirlineRequest req);
    }
}