
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
    LEA SI, VAL1
    CALL PRINT_VAL
    
    LEA SI, VAR_0
    MOV BX, [SI]
    MUL BL
    DIV BX
    ADD AL, 20h
    
    LEA SI, VAL2
    MOV BX, 00A0H
    CALL PRINT_VAL
    
    
    
    
    MOV ES:[DI], AL
    
ret 

VAR_0 DB 40d
VAL1 DB "The inputted C is ", 0
VAL2 DB "Therefore, ( 10C * 9/5) + 32 = ", 0


PRINT_VAL:
    
    MOV AX, 0B800H
    MOV ES, AX
    MOV AX, CS
    MOV DS, AX
    MOV DI, BX
    SHOW:
        CMP [SI], 0
        JZ EXIT
        MOVSB
        INC DI
       
    LOOP SHOW
    EXIT:

RET

CDIV:
    PUSH CX
    MOV CX, 0
    
    LOOPA:
    INC CX
    CMP [BX], DX
    JS EXIT_LOOP
    SUB BX, DX
    
    
    JMP LOOPA
    EXIT_LOOP:
    
    MOV BX, CX
    POP CX
RET


;SET CX AS MULTIPLICAND
CMUL:
    
    MOV DX, BX
    MOV BX, 00H
    
    LOOPB:
        
        ADD BX, DX 
        
    LOOP LOOPB

RET