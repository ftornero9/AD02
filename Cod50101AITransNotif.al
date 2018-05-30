codeunit 50101 "AI Translator Notif. Action"
{
    trigger OnRun()
    begin
        
    end;
    
    procedure ShowNotificationNewAppAITranslator()
    var
        MyNotifications: Record "My Notifications";
        MyNotification: Notification;
        NotificationMgt : Codeunit "Notification Management";
    begin
        
        IF MyNotifications.Get(USERID,GetGUID()) Then 
           MyNotifications.Delete();

        MyNotifications.InsertDefault(GetGUID,'AI Translator Setup','Notify if AI Translator Setup not done',true);

        WITH MyNotification DO BEGIN
            Id := GetGUID;
            Message := 'You have new app: AI Translator';
            Scope := NotificationScope::LocalScope;
            AddAction('Setup', CODEUNIT::"AI Translator Notif. Action", 'RunSetupWizard');
            Send;
        END;

    end;

    procedure RunSetupWizard(var MyNotification : Notification);
    var 

    begin
       RunSetupWizard(); 
    end;

    local procedure RunSetupWizard()
    var
        
    begin 
        Page.Run(Page::"AI Translator Setup Wizar");        
    end;

    local procedure GetGUID(): Guid
    begin
        EXIT('673bf93d-02ed-4091-a005-d12c401d6cd0'); // Created with Create GUID
    end;  
    
}