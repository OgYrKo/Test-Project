codeunit 50496 "TestMAH-Codeunit Events"
{

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeToSalesHeaderInsert', '', false, false)]
    // local procedure SIK_55001_CU_CopyDOcumentMgt_OnCopySalesDocOnBeforeToSalesHeaderInsert(FromSalesHeader: Record "Sales Header"; var ToSalesHeader: Record "Sales Header"; MoveNegLines: Boolean)
    // var
    //     SalesHeader: Record "Sales Header";
    //     SIKSingleInstMgmt: Codeunit "TestMAH Single Instance Mgmt";
    //     RevisedTxt: Label '-R';
    //     BaseNo: Code[20];
    // begin
    //     if not SIKSingleInstMgmt.GetCreateRevisedSalesDoc() then
    //         exit;

    //     if StrPos(FromSalesHeader."No.", RevisedTxt) <> 0 then
    //         BaseNo := copystr(copystr(FromSalesHeader."No.", 1, StrPos(FromSalesHeader."No.", RevisedTxt) - 1), 1, MaxStrLen(BaseNo))
    //     else
    //         BaseNo := FromSalesHeader."No.";

    //     SalesHeader.SetRange("Document Type", FromSalesHeader."Document Type");
    //     SalesHeader.SetFilter("No.", '%1|%2', BaseNo, BaseNo + RevisedTxt + '*');

    //     ToSalesHeader."No." := copystr(BaseNo + RevisedTxt + format(SalesHeader.Count()), 1, MaxStrLen(ToSalesHeader."No."));
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeToSalesHeaderInsert', '', false, false)]
    local procedure CopyDocumentMgt_OnCopySalesDocOnBeforeToSalesHeaderInsert(FromSalesHeader: Record "Sales Header"; var ToSalesHeader: Record "Sales Header"; MoveNegLines: Boolean)
    var
        SingleInstMgmt: Codeunit "TestMAH-Single Instance Mgmt";
        FuncMgnt: Codeunit "TestMAH-Functional Mgmt";
    begin
        if not SingleInstMgmt.GetCreateRevisedSalesDoc() then
            exit;
        ToSalesHeader."No." := copystr(FuncMgnt.GetNewNo(FromSalesHeader), 1, MaxStrLen(ToSalesHeader."No."));
    end;

}