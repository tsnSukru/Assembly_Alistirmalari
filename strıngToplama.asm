 .MODEL SMALL
 .STACK 64
 .DATA 
 
    MESAJ1 DB "BILGISAYAR$"   
    MESAJ2 DB "COMPUTER$" 
    MESAJ3 DB " $" 
    
    CHAR DB ?
    
    SATIR DB 0
    SUTUN DB 0 
    
    DIGIT1 DB 0
    DIGIT0 DB 0
    
 .CODE
 
 ANA PROC FAR
    MOV AX,@DATA
    MOV DS, AX
 
    MOV AL,00H
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
 ANA ENDP

 AYIR PROC
    
      MOV AH,0
      MOV BL,10
      DIV BL   
      
      ADD AL,30H
      ADD AH,30H
      
      MOV DIGIT1,AL 
      MOV DIGIT0,AH
   
      RET
 AYIR ENDP    
   
 YAZ PROC   
    MOV AH,09H
    INT 21H
    RET
 YAZ ENDP 
          
 YAZCHAR PROC         
    MOV DL,CHAR    
    MOV AH,02
    INT 21H
    RET  
 YAZCHAR ENDP   
 
 KURKON PROC
    MOV AH,02
    MOV BH,00
    MOV DH, SATIR
    MOV DL, SUTUN
    INT 10H
    RET
 KURKON ENDP 
 
 EKRSIL PROC
    MOV AX,0600H
    MOV BH,30H
    MOV CX,0000H
    MOV DX,184FH 
    INT 10H
    RET
 EKRSIL ENDP
 
 END ANA