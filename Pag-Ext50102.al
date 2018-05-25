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