using AutoMapper;

namespace PersonalCabinetAPI.DTO
{
    public class AccountDTOProfile: Profile
    {
        public AccountDTOProfile()
        {
            CreateMap<Account, AccountDTO>();
        }
    }
}