table 50101 "AI Translator Service Setup"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Primary Key"; Code[10])
        {
            
            DataClassification = ToBeClassified;
        }
        field(2;URL; Text[250])
        {
            
            DataClassification = ToBeClassified;
        }        
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    
    var
    
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