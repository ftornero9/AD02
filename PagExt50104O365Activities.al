pageextension 50104 AITranslatorNotify extends "O365 Activities"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnOpenPage()
    var
        ShowNotifAITransSetup: codeunit "AI Translator Notif. Action";
    begin
        ShowNotifAITransSetup.ShowNotificationNewAppAITranslator();
    end;
}