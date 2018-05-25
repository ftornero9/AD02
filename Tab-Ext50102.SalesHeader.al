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
    }

}