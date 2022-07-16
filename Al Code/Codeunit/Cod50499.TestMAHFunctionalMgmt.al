codeunit 50499 "TestMAH-Functional Mgmt"
{
    //Import Excel start
    procedure ImportItemsToLines(DocType: Enum "Sales Document Type"; DocNo: Code[20])
    begin
        ReadExcelSheet(TempExcelBuffer);
        ImportExcelData(DocType, DocNo, TempExcelBuffer);
    end;

    procedure TestImportItemsToLines(DocType: Enum "Sales Document Type"; DocNo: Code[20]; var TempExcelBufferRec: Record "Excel Buffer" temporary)
    begin
        CreateAndFillExcelBuffer(TempExcelBufferRec);
        ImportExcelData(DocType, DocNo, TempExcelBufferRec);
    end;

    procedure GetExcelBufferRec(): Record "Excel Buffer" temporary
    begin
        exit(TempExcelBuffer);
    end;

    procedure GetInsertedItemsCount(var TempExcelBufferRec: Record "Excel Buffer" temporary): Integer
    var
        MaxRowNo: Integer;
        RowNo: Integer;
        ImportedItemsCount: Integer;
    begin
        ImportedItemsCount := 0;
        RowNo := 0;
        MaxRowNo := 0;
        TempExcelBufferRec.Reset();
        if TempExcelBufferRec.FindLast() then
            MaxRowNo := TempExcelBufferRec."Row No.";

        for RowNo := 7 to MaxRowNo do
            if (GetValueAtCell(RowNo, 5, TempExcelBufferRec) <> '') and (GetValueAtCell(RowNo, 2, TempExcelBufferRec) <> '') then
                ImportedItemsCount += 1;
        exit(ImportedItemsCount);
    end;


    local procedure ReadExcelSheet(var TempExcelBufferRec: Record "Excel Buffer" temporary)
    var
        FileMgmt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text;
    begin
        UploadIntoStream(ExcelMessageLbl, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgmt.GetFileName(FromFile);
            SheetName := TempExcelBufferRec.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsgLbl);
        TempExcelBufferRec.Reset();
        TempExcelBufferRec.DeleteAll();
        TempExcelBufferRec.OpenBookStream(IStream, SheetName);
        TempExcelBufferRec.ReadSheet();
    end;

    local procedure CreateAndFillExcelBuffer(var TempExcelBufferRec: Record "Excel Buffer" temporary)
    begin
        TempExcelBufferRec.Reset();
        TempExcelBufferRec.DeleteAll();
        TempExcelBufferRec.CreateNewBook(SheetNameLbl);
        FillExcelBuffer(TempExcelBufferRec);
        TempExcelBufferRec.WriteSheet(HeaderTxt, CompanyName(), UserId());
        TempExcelBufferRec.CloseBook();
    end;

    local procedure FillExcelBuffer(var TempExcelBufferRec: Record "Excel Buffer" temporary)
    begin
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CurrentDateTime(), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('F1000', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn(34.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn(22.74, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn(61, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn(1387.14, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('3/4"', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('Blue Aluminum Pipe (19ft 8inch) each   20mm od', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8


        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CurrentDateTime(), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('F2000', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn(54.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn(35.74, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn(119, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn(4253.06, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('1"', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('Blue Aluminum Pipe (19ft 8inch) each   25mm od', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8


        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CurrentDateTime(), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('F4000', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn(79.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn(51.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn(0, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('1 1/2"', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('Blue Aluminum Pipe (19ft 8inch) each   40mm od', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8

        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CurrentDateTime(), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('F5000', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn(104.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn(68.24, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn(22, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn(1501.28, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('2"', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('Blue Aluminum Pipe (19ft 8inch) each   50mm od', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8

        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CurrentDateTime(), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('F17000', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn(179.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn(116.99, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn(127, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn(14857.73, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('3"', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('Blue Aluminum Pipe (19ft 8inch) each   80mm od', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8

        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8

        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CurrentDateTime(), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);//1
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//2
        TempExcelBufferRec.AddColumn(2730.74, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//3
        TempExcelBufferRec.AddColumn(1774.98, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//4
        TempExcelBufferRec.AddColumn(11, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//5
        TempExcelBufferRec.AddColumn(1774.98, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);//6
        TempExcelBufferRec.AddColumn('', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//7
        TempExcelBufferRec.AddColumn('SHIPPING -ship rate based on fully commercial delivery/semi access, no added services-rates subject to change', false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);//8

        TempExcelBufferRec.NewRow();
    end;


    local procedure ImportExcelData(DocType: Enum "Sales Document Type"; DocNo: Code[20]; var TempExcelBufferRec: Record "Excel Buffer" temporary)//v: Record  "Sales Line")
    var
        ItemRec: Record Item;
        SalesLineRec: Record "Sales Line";
        ItemNo: Code[20];
        Qty: Decimal;
        LineNo: Integer;
        MaxRowNo: Integer;
        RowNo: Integer;
        ImportedItemsCount: Integer;
    begin
        ImportedItemsCount := 0;
        RowNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        SalesLineRec.SetFilter("Document No.", DocNo);
        SalesLineRec.SetFilter("Document Type", Format(DocType));
        if SalesLineRec.FindLast() then
            LineNo := SalesLineRec."Line No.";
        TempExcelBufferRec.Reset();
        if TempExcelBufferRec.FindLast() then
            MaxRowNo := TempExcelBufferRec."Row No.";

        for RowNo := 7 to MaxRowNo do

            if (GetValueAtCell(RowNo, 5, TempExcelBufferRec) <> '') and (GetValueAtCell(RowNo, 2, TempExcelBufferRec) <> '') then begin //qty non null
                LineNo := LineNo + 10000;
                ImportedItemsCount += 1;
                ItemNo := CopyStr(GetValueAtCell(RowNo, 2, TempExcelBufferRec), 1, MaxStrLen(SalesLineRec."No."));
                if not ItemRec.Get(ItemNo) then
                    ItemRec := CreateItemByRow(RowNo, TempExcelBufferRec);
                Evaluate(Qty, GetValueAtCell(RowNo, 5, TempExcelBufferRec));
                CreateSalesLine(Qty, ItemRec, LineNo, DocType, DocNo);
            end;
        Message(ExcelImportSucessLbl, ImportedItemsCount);
    end;

    local procedure CreateSalesLine(Qty: Decimal; ItemRec: Record Item; NewLineNo: Integer; DocType: Enum "Sales Document Type"; DocNo: Code[20]): Record "Sales Line";
    var
        SalesLineRec: Record "Sales Line";
        SalesLineType: Enum "Sales Line Type";
    begin
        SalesLineRec.Init();
        SalesLineRec."Line No." := NewLineNo;
        SalesLineRec."Document No." := DocNo;
        SalesLineRec."Document Type" := DocType;
        SalesLineRec.Validate(Type, SalesLineType::Item);
        //SalesLineRec."No." := ItemRec."No.";
        SalesLineRec.Validate("No.", ItemRec."No.");
        SalesLineRec.Validate(Quantity, Qty);
        SalesLineRec.Insert(true);
        exit(SalesLineRec);
    end;

    local procedure CreateItemByRow(RowNo: Integer; var TempExcelBufferRec: Record "Excel Buffer" temporary): Record Item
    var
        ItemRec: Record Item;
    begin
        ItemRec.Init();
        ItemRec."No." := CopyStr(GetValueAtCell(RowNo, 2, TempExcelBufferRec), 1, MaxStrLen(ItemRec."No."));
        Evaluate(ItemRec."Unit Price", GetValueAtCell(RowNo, 3, TempExcelBufferRec));
        Evaluate(ItemRec."Unit Cost", GetValueAtCell(RowNo, 4, TempExcelBufferRec));
        ItemRec.Description := CopyStr(GetValueAtCell(RowNo, 8, TempExcelBufferRec), 1, MaxStrLen(ItemRec.Description));

        ItemRec.Validate("Gen. Prod. Posting Group", 'RETAIL');
        ItemRec.Validate("Inventory Posting Group", 'RESALE');
        ItemRec.Insert(true);
        exit(ItemRec);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer; var TempExcelBufferRec: Record "Excel Buffer" temporary): Text
    begin
        TempExcelBufferRec.Reset();
        If TempExcelBufferRec.Get(RowNo, ColNo) then
            exit(TempExcelBufferRec."Cell Value as Text")
        else
            exit('');
    end;
    //Import Excel end



    //Copy Sales start
    procedure CreateRevisedVersionFromSalesHeader(paramIncludeHeader: Boolean; paramRecalculateLines: Boolean; var paramSourceSalesHeader: Record "Sales Header")
    var
        NewSalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        CopyDocMgt: Codeunit "Copy Document Mgt.";
        ExactCostReversingMandatory: Boolean;
        RevisedVersionCreatedMsg: Label 'Revised version %1 has been created', Comment = '%1 - Document No.';
    begin
        SingleInstMgmt.SetCreateRevisedSalesDoc(true);
        SalesSetup.Get();
        ExactCostReversingMandatory := SalesSetup."Exact Cost Reversing Mandatory";

        CopyDocMgt.SetProperties(
          paramIncludeHeader, paramRecalculateLines, false, true, false, ExactCostReversingMandatory, false);
        CopyDocMgt.CopySalesDoc(paramSourceSalesHeader."Document Type", paramSourceSalesHeader."No.", NewSalesHeader);

        Message(RevisedVersionCreatedMsg, NewSalesHeader."No.");
        SingleInstMgmt.SetCreateRevisedSalesDoc(false);
    end;

    procedure CreateCopyFromRecord(FromSalesHeaderRec: Record "Sales Header")
    var
        NewSalesHeaderRec: Record "Sales Header";
        CopyDocMgt: Codeunit "Copy Document Mgt.";
    begin
        SingleInstMgmt.SetCreateRevisedSalesDoc(true);
        CopyDocMgt.SetProperties(
          true, false, false, true, false, false, false);
        CopyDocMgt.CopySalesDoc(FromSalesHeaderRec."Document Type", FromSalesHeaderRec."No.", NewSalesHeaderRec);
        SingleInstMgmt.SetCreateRevisedSalesDoc(false);
    end;

    local procedure CheckAvailableNo(SalesDocumentType: Enum "Sales Document Type"; SalesHeaderNo: Code[20]): Boolean
    var
        SalesHeaderCheckRec: Record "Sales Header";
    begin
        exit(SalesHeaderCheckRec.Get(SalesDocumentType, SalesHeaderNo));
    end;

    procedure GetNewNo(FromSalesHeaderRec: Record "Sales Header"): Code[20]
    var
        NewNo: Code[20];
    begin
        NewNo := CopyStr(FromSalesHeaderRec."No.", 1, 20);
        repeat
            NewNo := CopyStr(GetNextNo(NewNo), 1, 20);
        until not CheckAvailableNo(FromSalesHeaderRec."Document Type", NewNo);
        exit(CopyStr(NewNo, 1, 20));
    end;

    local procedure GetNextNo(codeNo: Code[20]): Code[20]
    begin
        if (Format(codeNo).Contains(CopySuffixLbl)) then
            exit(IncrementLastNumber(codeNo))
        else
            exit(AddNumber(codeNo));
    end;

    local procedure IsDigit(symbhol: Char): Boolean
    begin
        exit((symbhol >= 48) and (symbhol <= 57));
    end;

    local procedure AddNumber(CodeNo: Code[20]): Code[20]
    var
        StartNumberLbl: Label '1';
    begin
        exit(CopyStr(Format(CodeNo) + CopySuffixLbl + StartNumberLbl, 1, 20))
    end;

    // local procedure IsChangeRank(number: Integer; power: Integer): Boolean
    // begin
    //     exit((number / power(10, power)) >= 1);
    // end;

    local procedure IncrementLastNumber(codeNo: Code[20]): Code[20]
    var
        currentNumber: Integer;
        newNumber: Integer;
        numberLen: Integer;
        strLen: Integer;
    begin
        strLen := strLen(codeNo);
        numberLen := GetNumberLength(codeNo);
        Evaluate(currentNumber, Format(codeNo).Substring(strLen - numberLen + 1, numberLen));
        newNumber := currentNumber + 1;
        exit(CopyStr(Format(codeNo).Substring(1, strLen - numberLen) + Format(newNumber), 1, 20));
    end;

    local procedure GetNumberLength(codeNo: Code[20]): Integer
    var
        counter: Integer;
        strLen: Integer;
    begin
        strLen := strLen(codeNo);
        counter := 0;
        while ((counter < strLen) and IsDigit(codeNo[strLen - counter])) do
            counter += 1;
        exit(counter);
    end;

    procedure GetCopySuffix(): Text
    begin
        exit(CopySuffixLbl);
    end;
    //Copy Sales end

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        SingleInstMgmt: Codeunit "TestMAH-Single Instance Mgmt";
        FileName: Text;
        SheetName: Text;
        CopySuffixLbl: Label '-R';
        ExcelImportSucessLbl: Label 'Excel is successfully imported %1 items', Comment = '%1 - Count of imported items';
        ExcelMessageLbl: Label 'Choose excel file';
        NoFileFoundMsgLbl: Label 'No Excel file found!';
        SheetNameLbl: Label 'Sheet1';
        HeaderTxt: Label 'MAHExcelFile';


}