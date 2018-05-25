tableextension 50102 AILanguage extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "AI Language"; Code[10])
        {
            Caption = 'AI Language';
            TableRelation = "AI Supported Language";
        }

        modify("Bill-to Customer No.")
        {
            trigger OnAfterValidate()
                var 
                    Customer:Record Customer;
                    Language:Record Language;
                begin
                    if Customer.Get("Bill-to Customer No.") then begin
                       if Customer."Language Code" <> '' then begin
                           if Language.Get(Customer."Language Code") then
                             "AI Language" := Language."AI Language";
                       end;
                    end;
                end;   
        }

    }
    

}