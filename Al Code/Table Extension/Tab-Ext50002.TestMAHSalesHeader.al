tableextension 50002 "TestMAH-Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; "Delivery Location"; Enum "Delivery Location")
        {
            Caption = 'Delivery Location';
            DataClassification = ToBeClassified;
        }
        field(50001; "Receiving Phone"; Text[20])
        {
            Caption = 'Receiving Phone';
            DataClassification = ToBeClassified;
        }
        field(50002; "Date Needed By"; Date)
        {
            Caption = 'Date Needed By';
            DataClassification = ToBeClassified;
        }
        field(50003; Guaranteed; Boolean)
        {
            Caption = 'Guaranteed';
            DataClassification = ToBeClassified;
        }
    }
}
