using AutoMapper;

namespace PersonalCabinetAPI.DTO
{
    public class OperationDtoProfile: Profile
    {
        public OperationDtoProfile()
        {
            CreateMap<Operation, OperationDTO>();
            CreateMap<string, OperationDTO>();
        }
    }
}