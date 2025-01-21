
;MEMBERS:
;   Chu, Rey Lawrence
;   Florin, Gillian E.
;   Manilong, Kaye Louise A.


;   Caesar Cipher Program

org 100h
.data
    STR_P DB "Please Input a String to shift: $" 
    STR_I DB 250, ?, 250 DUP ('$')  ;Input String
    STR_O DB 250 DUP ('$')          ;Output String
    NEW_L DB 010, 013, '$'          ;New Line
    SHF_S DB 3                       ;Size of Shift

.code
    ;DISPLAY PROMPT STRING
    MOV DX, OFFSET STR_P
    CALL DISP_STR
    
    ;ACCEPT INPUT FOR STRING
    MOV DX, OFFSET STR_I    
    CALL ACCEPT_INPUT
    
    ;CAESAR SHIFT
    LEA SI, STR_I   ;SET Inputted String in SI
    LEA DI, STR_O   ;SET Output String in DI
    INC SI
    XOR CX, CX
    MOV CL, [SI]
    INC SI
    CALL CAESAR    
    
    
    ;PRINT NEW LINE
    MOV DX, OFFSET NEW_L
    CALL DISP_STR
    ;DISPLAY OUTPUT STRING
    MOV DX, OFFSET STR_O
    CALL DISP_STR
ret


;Precon: set OFFSET STR_I in DX
PROC ACCEPT_INPUT
    MOV AH, 0AH
    INT 21H
RET


;Precon:    set LEA of STR_I in SI
;           set LEA of STR_O in DI
;           set size in CX
PROC CAESAR
    
    ;LOOP TO SHIFT A CHARACTER 3 PLACES
    RAINBOW_SUNSHINE:
    PUSH CX
        MOV AL, [SI]
                         
                         
                         ;Exceptions to Caesar Shift
        CMP AL, 'A'         ;Symbols below 'A'
        JB  SKIP_BACK
        
        CMP AL, 'z'         ;Symbols above 'z'
        JA  SKIP_BACK
        
        CMP AL, 'a'         
        JA  NOT_A_SYMBOL
        
        CMP AL, 'Z'         ;Symbols between 'A' and 'Z'
        JA  SKIP_BACK
        
        NOT_A_SYMBOL:
 
        
        MOV AH, AL      ;Store char in AH, AL is about to be shifted
        
        MOV BL, SHF_S   ;Load Shift Size in BL
        ADD AL, BL
                        
                        
        CMP AH, 'Z'     ;If unshifted CHAR is uppercase
        JA  LOWERCASE       
        CMP AL, 'Z'         ;If shifted CHAR > 'Z' or lowercase         
        JNA SKIP_BACK
            SUB AL, 26          ;Return to 'A' by subtracting 26
                                
                        
        LOWERCASE:                
        CMP AL, 'z'     ;Else If Shifted CHAR is below 'z', do nothing
        JNA SKIP_BACK   
        
            SUB AL, 26  ;Else return to 'a' by subtracting 26
                
        SKIP_BACK:
        MOV [DI], AL    ;Iterate
        INC DI
        INC SI            
    
    POP CX
    LOOP RAINBOW_SUNSHINE 
    
RET

;Precon: set OFFSET STR in DX
PROC DISP_STR
    MOV AH, 09H
    INT 21H
RET    