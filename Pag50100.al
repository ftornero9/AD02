page 50100 "AI Supportes Languages List"
{
    PageType =  List;
    SourceTable = "AI Supported Language";
    UsageCategory = Lists;
    ApplicationArea = All;
    ModifyAllowed = true;
    InsertAllowed = true;
    
    layout
    {
        area(content)
        {
            repeater("AI Languages")
            {
                field("AI Language Code"; "AI Language Code")
                {
                   ApplicationArea = All;                     
                }
                field(Description; Description)
                {
                   ApplicationArea = All; 
                }                
            }
        }
    }
    
    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
        
    var
        myInt: Integer;
}