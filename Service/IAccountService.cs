using System.Threading.Tasks;
using PersonalCabinetAPI.DTO;

public interface IAccountService
{
    public Task<bool> LoginTransaction(Account account);
    public Task<bool> RegisterTransaction(Account account);
}