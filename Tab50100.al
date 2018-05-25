table 50100 "AI Supported Language"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"AI Language Code"; Code[10])
        {
            
            Caption = 'AI Language Code';
        }

        field(2;Description; Text[10])
        {
            
            Caption = 'Description';
        }        
    }
    
    keys
    {
        key(PK; "AI Language Code")
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}