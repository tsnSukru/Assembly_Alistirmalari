.MODEL SMALL
.STACK 64
.DATA

TABLO DB 2,-5,7,0,9,6,3,25,17,8
BUYUKSAYI DB ?

.CODE
ANA PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    
    LEA SI,TABLO
    MOV AL,[SI]
    MOV BUYUKSAYI,AL
    MOV CX,10
  TEKRAR: 
    CMP AL,BUYUKSAYI
    JG DEGISTIR; eksi degerlerle calistigimiz icin jg kullandik
    JMP ATLA
  DEGISTIR:  
    MOV BUYUKSAYI,AL
  ATLA:      
    INC SI
    MOV AL,[SI]        
    LOOP TEKRAR   
    
 MOV AH,4CH
 INT 21H

ANA ENDP
 END ANA            