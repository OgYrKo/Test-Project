codeunit 50498 "TestMAH-Single Instance Mgmt"
{
    SingleInstance = true;

    procedure SetCreateRevisedSalesDoc(paramCreateRevisedSalesDoc: Boolean)
    begin
        CreateRevisedSalesDoc := paramCreateRevisedSalesDoc;
    end;

    procedure GetCreateRevisedSalesDoc(): Boolean
    begin
        exit(CreateRevisedSalesDoc);
    end;

    var
        CreateRevisedSalesDoc: Boolean;
}