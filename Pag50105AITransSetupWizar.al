page 50104 "AI Translator Setup Wizar"
{
    PageType = NavigatePage;
    SourceTable = "AI Translator Service Setup";
    SourceTableTemporary = true;
    Caption = 'AI Translator Service Setup Wizar';
    
    layout
    {
        area(content)
        {
            group(TopBannerOnFirstStep)
            {
                Visible=TopBannerVisible AND NOT FinalStepVisible; 
                CaptionML = ENU = '';
                field(MediaResourcesStandard;MediaResourcesStandard."Media Reference")
                {
                ApplicationArea=All;
                Editable=false;
                ShowCaption=false;
                }
            } 
            group(Step1)
            {
                Visible=FirstStepVisible;
                group(Step1Welcome)
                {
                Visible=FirstStepVisible;
                CaptionML = ENU = 'AI Translator Service Setup';
                InstructionalTextML = ENU = 'This wizard will help you to configure the app. After filling all fields, click Finish.';                  
                }
                group(Step1LetsGo)
                {  
                Visible=FirstStepVisible;
                CaptionML = ENU = 'Lets Go!';
                InstructionalTextML = ENU = 'Choose Next!';
                }
            } 
            group(Step2)
            {
                Visible=SecondStepVisible;

                group(Step2Welcome)
                {
                    CaptionML=ENU='Welcome to AI Translator Service Setup';
                    Visible=SecondStepVisible;
                    group(Step2FillFields)
                    {
                        CaptionML = ENU = '';
                        InstructionalTextML=ENU='Fill in the following field';
                        Visible=SecondStepVisible;
                        field("Azure Key";"Azure Key")
                        {
                            ApplicationArea=All;
                            ShowMandatory = true;            
                        }
                    }
                }
                    
            }
            group(StepFinal)
            {
                Visible=FinalStepVisible;
                group("That's it!")
                {
                    CaptionML=ENU='That''s it!';
                    InstructionalTextML=ENU='To finish the Setup, choose Finish.';
                }
            }

        }
    }
    
    actions
    {
        area(processing)
        {
            action("AIT ActionBack")
            {
                ApplicationArea=Basic,Suite;
                CaptionML=ENU='Back';
                Enabled=BackActionEnabled;
                Image=PreviousRecord;
                InFooterBar=true;

                trigger OnAction();
                begin
                    NextStep(TRUE);
                end;
            }
            action("AIT ActionNext")
            {
                ApplicationArea=Basic,Suite;
                CaptionML=ENU='Next';
                Enabled=NextActionEnabled;
                Image=NextRecord;
                InFooterBar=true;

                trigger OnAction();
                begin
                    NextStep(FALSE);
                end;
            }
            action("AIT ActionFinish")
            {
                ApplicationArea=Basic,Suite;
                CaptionML=ENU='Finish';
                Enabled=FinishActionEnabled;
                Image=Approve;
                InFooterBar=true;

                trigger OnAction();
                begin
                    FinishAction;
                end;
            } 
        }
    }

    trigger OnInit();
    begin        
        LoadTopBanners;
    end;

    trigger OnOpenPage()
    begin
        Insert();
        Step := Step::Start;
        EnableControls;
    end;

    var    
        MediaRepositoryStandard : Record 9400;
        MediaRepositoryDone : Record 9400;
        MediaResourcesStandard : Record 2000000182;
        MediaResourcesDone : Record 2000000182;
        Step : Option Start,Creation,Finish;
        TopBannerVisible : Boolean;        
        FirstStepVisible : Boolean;
        SecondStepVisible : Boolean;
        FinalStepVisible : Boolean;
        FinishActionEnabled : Boolean;
        BackActionEnabled : Boolean;
        NextActionEnabled : Boolean;     
        AzureKeyMsg : TextConst ENU = 'You must fill the Azure Key';
    local procedure EnableControls()
    begin
        CheckFilledValues();

        ResetControls;

        Case Step Of
        Step::Start:
            ShowStartStep;
        Step::Creation:
            ShowSecondStep;
        Step::Finish:
            ShowFinalStep;
        end;       
    end;   

    local procedure LoadTopBanners();
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(CURRENTCLIENTTYPE)) and
           MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png',Format(CURRENTCLIENTTYPE)) then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
               MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref") then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
    end;

    local procedure NextStep(Backwards : Boolean);
    begin
        IF Backwards THEN
        Step := Step - 1
        ELSE
        Step := Step + 1;

        EnableControls;
    end;

    local procedure FinishAction();
    var
        Setup : Record "AI Translator Service Setup";
    begin
        SaveInDatabase(Setup);
        CurrPage.CLOSE;
    end;

      local procedure ShowStartStep();
    begin
        FirstStepVisible := TRUE;
        FinishActionEnabled := FALSE;
        BackActionEnabled := FALSE;
    end;

    local procedure ShowSecondStep();
    begin
        SecondStepVisible := TRUE;
        FinishActionEnabled := FALSE;
    end;

    local procedure ShowFinalStep();
    var
    begin
        FinalStepVisible := TRUE;
        BackActionEnabled := FALSE;
        NextActionEnabled := FALSE;
    end;

    local procedure ResetControls();
    begin
        FinishActionEnabled := TRUE;
        BackActionEnabled := TRUE;
        NextActionEnabled := TRUE;

        FirstStepVisible := FALSE;
        SecondStepVisible := FALSE;
        FinalStepVisible := FALSE;
    end;

    local procedure SaveInDatabase(var Setup : Record "AI Translator Service Setup")
    var  
    begin
        Setup.InsertIfNotExists();
        Setup.TransferFields(Rec);
        Setup.Modify();
    end; 

    local procedure CheckFilledValues()
    begin
        If Step = Step::Finish then begin
            If "Azure Key" = '' then begin
                Message(AzureKeyMsg);
                Step := Step - 1;
                exit;
            end;
        end;
      end;           
}