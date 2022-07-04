using System;
using AutoMapper;

namespace PersonalCabinetAPI.DTO
{
    public class EntryDtoProfile: Profile
    {
        public EntryDtoProfile()
        {
            CreateMap<Entry, EntryDTO>();
            CreateMap<Operation, EntryDTO>();
            CreateMap<string, EntryDTO>()
                .ForMember(t => t.time, opt => opt.MapFrom(src => DateTime.Parse(src)))
                .ForMember(t => t.depart_datetime, opt => opt.MapFrom(src => DateTime.Parse(src)));
        }
        
    }
}