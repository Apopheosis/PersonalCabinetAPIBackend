using System;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web.Helpers;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using PersonalCabinetAPI.DTO;

namespace PersonalCabinetAPI.Service
{
    public class AccountService:IAccountService
    {
        private readonly DatabaseContext _context;
        private readonly IMapper _mapper;

        public AccountService(DatabaseContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task<bool> LoginTransaction(Account account)
        {
            Account accountDb = _context.accounts.ToList().FirstOrDefault(a =>
                a.login == account.login && a.password==EncodePassword(account.password), null);
            if (accountDb is null) return false;
            return true;
        }
        
        public async Task<bool> RegisterTransaction(Account account)
        {
            try
            {
                account.password = EncodePassword(account.password);
                bool exists = _context.accounts.ToList().Any(a => a.login == account.login && a.password == account.password);
                if (!exists)
                {
                    await _context.accounts.AddAsync(account);
                    await _context.SaveChangesAsync();
                }
                else
                {
                    throw new DbUpdateException();
                }
                
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static string EncodePassword(string password)
        {
            var passwd = Crypto.Hash(password);
            return passwd;
        }
        
    }
}