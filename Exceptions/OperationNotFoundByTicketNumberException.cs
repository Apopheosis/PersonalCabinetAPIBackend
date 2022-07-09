using System;

[Serializable]
public class OperationNotFoundByTicketNumberException : Exception
{
    public OperationNotFoundByTicketNumberException () {}
    public OperationNotFoundByTicketNumberException (string number) : base($"Operations with ticket_number of {number} are not found in the database.") {}
}