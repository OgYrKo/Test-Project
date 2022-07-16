pageextension 50001 "TestMAH-Sales Quote Subform" extends "Sales Quote Subform"//95
{
    actions
    {
        addlast("F&unctions")
        {
            action("TestMAH-ExcelImport")
            {
                ApplicationArea = All;
                Caption = 'Import Excel';
                Ellipsis = true;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Import Excel action.';

                trigger OnAction()
                var
                    FuncMgmt: Codeunit "TestMAH-Functional Mgmt";
                //InformLbl: Label 'Excel Imported!';
                begin
                    FuncMgmt.ImportItemsToLines(Rec."Document Type", Rec."Document No.");
                    //Message(InformLbl);
                end;
            }
        }
    }
}
