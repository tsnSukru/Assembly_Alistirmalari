 .MODEL SMALL
 .STACK 64
 .DATA 
 
    MESAJ1 DB "VIZE:$"   
    MESAJ2 DB "FINAL:$" 
    MESAJ3 DB "GENEL ORTALAMA:$"   
    MESAJ4 DB ".5$"
                         
    VIZE DB 0 
    VIZEoRT DB 0
    FINAL DB 0
    FINALoRT DB 0 
    KALAN DB 0
    GENELnOT DB 0   
        
    CHAR  DB ?
    
    SATIR DB 0
    SUTUN DB 0 
    
    DIGIT1 DB 0
    DIGIT0 DB 0
    
 .CODE
 
 ANA PROC FAR
    MOV AX,@DATA
    MOV DS, AX
 
    CALL EKRSIL
    CALL KURKON 
    
    LEA DX,MESAJ1
    CALL YAZ
    
    ;1. SAYININ OKUNMASI
    MOV AH,00H
    INT 16H   
    MOV CHAR,AL
    CALL YAZCHAR
    ADD AL,-48;decimal degeri icin
    MOV BL,10;onlar basamagi icin ilk degeri 10la carptik
    MUL BL   
    MOV VIZE,AL 
    
    MOV AH,00H
    INT 16H   
    MOV CHAR,AL
    CALL YAZCHAR 
    ADD AL,-48
    ADD VIZE,AL;10 lar basamagiyla topladik
    
    MOV AH,0
    MOV AL,VIZE
    MOV BL,2;yuzde ellisi icin ikiye bolduk
    DIV BL
    MOV VIZEoRT,AL
    MOV KALAN,AH;kusurat icin kalan lazim 
    
    ;2. SAYININ OKUNMASI  
    
    INC SATIR
    CALL KURKON
    LEA DX,MESAJ2
    CALL YAZ
    
    MOV AH,00H
    INT 16H    
    MOV CHAR,AL
    CALL YAZCHAR
    ADD AL,-48    
    MOV BL,10
    MUL BL   
    MOV FINAL,AL
    
    MOV AH,00H
    INT 16H     
    MOV CHAR,AL
    CALL YAZCHAR
    ADD AL,-48
    ADD FINAL,AL  
    
    MOV AH,0
    MOV AL,FINAL
    MOV BL,2
    DIV BL
    MOV FINALoRT,AL
    ADD KALAN,AH 
    
    ;NOTUN TOPLANMASI 
    
    INC SATIR
    CALL KURKON
    LEA DX,MESAJ3
    CALL YAZ
    
    MOV AL,KALAN;KALAN 2 ISE GENELNOTU 1 ARTIR
    CMP AL,2
    JNE ATLA1
    MOV GENELnOT,1
    
    ATLA1:
    MOV AL,VIZEoRT
    ADD GENELnOT,AL
    MOV AL,FINALoRT
    ADD GENELnOT,AL   
    
    MOV AL,GENELnOT
    CALL AYIR      
    
    MOV AL,DIGIT1
    MOV CHAR,AL
    CALL YAZCHAR 
    
    MOV AL,DIGIT0
    MOV CHAR,AL
    CALL YAZCHAR
    
    MOV AL,KALAN;KALAN 1 SE GENEL NOTU 0.5 ARTIR
    CMP AL,1
    JNE ATLA2
    LEA DX,MESAJ4
    CALL YAZ
    
    ATLA2:
    
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