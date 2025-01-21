
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
; Gillian Florin

org 100h
    
    LEA SI, MSG1
    CALL PRINT_STRING
    
    XOR BX, BX
    
    MOV AH, 00H
    INT 16H
    MOV ES:[DI], AL
    ADD DI, 2
    SUB AL, 30H
    
    MOV BH, AL
          
          
          
    MOV AH, 00H
    INT 16H
    MOV ES:[DI], AL
    SUB AL, 30H
          
          
          
          
    MOV BL, AL
    MOV AX, BX
    
    AAD
    
    MOV CX, AX      ;STORE SUM IN CX BEC OUR FUNCTIONS USE CX
    PUSH AX
    
    LEA DI, STRB
    CALL CONVERT_BINARY
                     
                     
    MOV BX, 0A0H
    
    LEA SI, MSGB      
    CALL PRINT_STRING
    MOV BX, DI      ;GET THE OFFSET BACK AFTER PRINTING
    LEA SI, STRB      
    CALL PRINT_STRING
    
    
    POP CX
    LEA DI, STRH
    CALL CONVERT_HEX
    
    MOV BX, 0140H 
    
    LEA SI, MSGH
    CALL PRINT_STRING
    
    MOV BX, DI
    
    LEA SI, STRH
    CALL PRINT_STRING
    
   

ret

MSG1 DB "Input 2 digit decimal: ", 0
MSGB DB "In binary: ", 0
MSGH DB "In hex: ", 0
STRB DB 9 DUP(?)
STRH DB 3 DUP(?)


;PRECON: SET OFFSET IN BX
;           SET LEA IN SI
PRINT_STRING:
    MOV AX, 0B800H
    MOV ES, AX
    MOV AX, CS
    MOV DS, AX
    MOV DI, BX
    SHOW:
        CMP [SI], 0
        JZ  PRINT_EXIT
        MOVSB
        INC DI
       
    LOOP SHOW
    PRINT_EXIT:
        

RET


;PRECON: SET STRB IN SI
;           SET INPUT VAL IN CX 
CONVERT_BINARY:
    PUSH CX
    PUSH DX        
    
    MOV DX, 128
    
    BIN_CON_LOOP:
    
        CMP CX, DX
        JS BIN_ZERO
        SUB CX, DX
        MOV [DI], '1'
        JMP POST_CON
        
        BIN_ZERO:
        MOV [DI], '0'
    
    POST_CON:
    INC DI 
    SHR DX, 1
    
    CMP DX, 0
    JNZ BIN_CON_LOOP
    
    MOV [DI], 0
    
    POP DX
    POP CX
RET





CONVERT_HEX:
    PUSH AX
    
    MOV AX, CX
    MOV CL, 10H
    DIV CL
    
    CMP AL, 0AH
    JS MSB_LESS
    ADD AL, 37H
    JMP MSB_SKIP
    MSB_LESS:
    ADD AL, 30H
    
    MSB_SKIP:
    
    
    CMP AH, 0AH
    JS LSB_LESS
    ADD AH, 37H
    JMP LSB_SKIP
    LSB_LESS:
    ADD AH, 30H
    
    LSB_SKIP:
    
    
    MOV [DI], AL
    INC DI
    
    MOV [DI], AH
    INC DI
    
    MOV [DI], 0      
   
    POP AX
RET

