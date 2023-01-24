.MODEL SMALL
.STACK 64
.DATA

YAZI DB 'Kastamonu Universtitesi'     

.CODE
 
 ANA PROC FAR
     MOV AX,@DATA
     MOV DS,AX 
     
     MOV AL,0
     MOV CX,22
     LEA SI,YAZI
     
 BAS:
    MOV AL,[SI]                  
                   
    CMP AL,61H
    JB ZATENBUYUK
    
    CMP AL,7AH
    JA ZATENBUYUK   
    
    
    CMP AL,'e'
    JNE ZATENBUYUK 
    
    SUB AL,20H
    
    MOV [SI],AL
    
 ZATENBUYUK:
    INC SI
    LOOP BAS  
    
    MOV AH,4CH
    INT 21H
 ANA ENDP
  END ANA