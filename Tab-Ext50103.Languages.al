tableextension 50103 AILanguageLanguage extends Language
{
    fields
    {
        // Add changes to table fields here
        field(50100; "AI Language"; Code[10])
        {
            Caption = 'AI Language';
            TableRelation = "AI Supported Language";
        }
    }
    
    var
        myInt: Integer;
}