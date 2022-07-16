pageextension 50071 "TestMAH-Sales Quote" extends "Sales Quote"//41
{
    layout
    {
        addlast("Shipping and Billing")
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

    actions
    {
        //Pasha Mamin
        addafter(CopyDocument)
        {
            action("TestMAH-Create Revised Version")
            {
                ApplicationArea = Suite;
                Caption = 'Create Revised Version';
                Ellipsis = true;
                Enabled = Rec."No." <> '';
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create revised version and copy document lines and header information.';

                trigger OnAction()
                var
                    SIKFuncMgmt: Codeunit "TestMAH-Functional Mgmt";
                begin
                    SIKFuncMgmt.CreateRevisedVersionFromSalesHeader(true, false, Rec);
                end;
            }
        }

        //MAH
        addlast(processing)
        {
            action("TestMAH-CopySales")
            {
                Caption = 'Copy Sales';
                Image = Copy;
                ApplicationArea = All;
                ToolTip = 'Executes the Copy Sales action.';
                trigger OnAction()
                var
                    FuncMgmt: Codeunit "TestMAH-Functional Mgmt";
                begin
                    if not Rec.Find() then begin
                        Rec.Insert(true);
                        Commit();
                    end;
                    FuncMgmt.CreateCopyFromRecord(Rec);
                end;
            }
        }
    }
}