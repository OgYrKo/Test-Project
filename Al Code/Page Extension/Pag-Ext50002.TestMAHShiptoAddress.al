pageextension 50002 "TestMAH-Ship-to Address" extends "Ship-to Address"//300
{
    layout
    {
        addlast(General)
        {
            field("Delivery Location"; Rec."Delivery Location")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Delivery Location';
                ToolTip = 'Specifies the value of the Delivery Location field.';
            }
            field("Receiving Phone"; Rec."Receiving Phone")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Receiving Phone';
                ToolTip = 'Specifies the value of the Receiving Phone field.';
            }
            field("Date Needed By"; Rec."Date Needed By")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Date Needed By';
                ToolTip = 'Specifies the value of the Date Needed By field.';
            }
            field(Guaranteed; Rec.Guaranteed)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Guaranteed';
                ToolTip = 'Specifies the value of the Guaranteed field.';
            }
        }
    }

}
