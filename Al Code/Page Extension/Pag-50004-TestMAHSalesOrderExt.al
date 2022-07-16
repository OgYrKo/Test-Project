pageextension 50004 "TestMAH-Sales Order" extends "Sales Order"
{
    layout
    {
        addlast("Shipping and Billing")
        {
            field("TestMAH-Delivery Location"; Rec."Delivery Location")
            {
                ApplicationArea = All;
                Caption = 'Delivery Location';
                ToolTip = 'Specifies the value of the Delivery Location field.';
            }
            field("TestMAH-Receiving Phone"; Rec."Receiving Phone")
            {
                ApplicationArea = All;
                Caption = 'Receiving Phone';
                ToolTip = 'Specifies the value of the Receiving Phone field.';
            }
            field("TestMAH-Date Needed By"; Rec."Date Needed By")
            {
                ApplicationArea = All;
                Caption = 'Date Needed By';
                ToolTip = 'Specifies the value of the Date Needed By field.';
            }
            field("TestMAH-Guaranteed"; Rec.Guaranteed)
            {
                ApplicationArea = All;
                Caption = 'Guaranteed';
                ToolTip = 'Specifies the value of the Guaranteed field.';
            }
        }
    }
}
