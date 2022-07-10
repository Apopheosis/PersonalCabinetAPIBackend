using System;

[Serializable]
public class OperationNotFoundByDocNumberException : Exception
{
    public OperationNotFoundByDocNumberException() {}
    public OperationNotFoundByDocNumberException(string number) : base($"Operations with doc_number of {number} are not found in the database.") {}
}