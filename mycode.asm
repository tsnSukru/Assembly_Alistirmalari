.MODEL SMALL
.STACK 64
.DATA

SATIR DB 00H
SUTUN DB 00H   

STRING1 DW 'KAS#AM#NU$'
STRING2 DW 'KASTAMONU$'     
STRING3 DB 0
                   
CHAR DB ?  

.CODE
 
 ANA PROC FAR
    MOV AX,@DATA
    MOV DS,AX 
        
    
    MOV AH,4CH
    INT 21H
 ANA ENDP
 
 EKRSIL PROC
    MOV AH,06H
    MOV BH,30H
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
    RET
 EKRSIL ENDP
 
 KURKON PROC
    MOV AH,02H
    MOV BH,00H
    MOV DH,SATIR
    MOV DL,SUTUN
    INT 10H
    RET
 KURKON ENDP 
 
 YAZ PROC
    MOV AH,09
    INT 21H
    RET
 YAZ ENDP   
            
 YAZCHAR PROC
    MOV DL,CHAR
    MOV AH,02H
    INT 21H
    RET
 YAZCHAR ENDP     
            
 END ANA