pageextension 50103 AILanguageLanguagePag extends Languages
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field("AI Language";"AI Language")
            {
                Caption = 'AI Language';
                ApplicationArea = All;
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}