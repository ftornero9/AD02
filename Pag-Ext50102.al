pageextension 50102 AILanguagePage extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addafter ("Quote No.")
        {
            field("AI Language"; "AI Language") 
            {
                Caption = 'AI Language';
                ApplicationArea = All;
            } 
        }
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
                var 
                    Customer:Record Customer;
                    Language:Record Language;
                begin
                    if Customer.Get("Sell-to Customer No.") then begin
                       if Customer."Language Code" <> '' then begin
                           if Language.Get(Customer."Language Code") then
                             "AI Language" := Language."AI Language";
                       end;
                    end;
                end;   
        }
    }
    
    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action(Translate)
            {
                Caption = 'Translate';
                ToolTip = 'Translate';
                Promoted = true;
                PromotedIsBig = true;
                Image = Language;
                ApplicationArea = All;

                trigger OnAction();
                 begin
                    MESSAGE('Translate!');
                end;
            }
        }
    }

}