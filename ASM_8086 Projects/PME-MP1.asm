
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
; Florin, Gillian

org 100h

    ;ACCEPT 3 VALUES
    
    LEA SI, LETT1
    CALL ACCEPT_INPUT
    MOV [SI], BH
    
    
    LEA DI, LETT2                
    CALL ACCEPT_INPUT
    MOV [DI], BH
    
    LEA DI, LETT3
    CALL ACCEPT_INPUT
    MOV [DI], BH
    
    ;LOOP
    
    MOV CX, 24
    
    MOV AX, 0B800h          ; position
    MOV DS, AX
    MOV BX, 00F50h
    
    
    SHOW_LOOP:
    
        PUSH CX                 ;FREE UP CX
        
        LEA DI, LETT1                        
        MOV CL, [DI]        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX                    
                     
        LEA DI, LETT2                     
        ADD BX, 2
        MOV CL, [DI]        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
        
        LEA DI, LETT3                  
        ADD BX, 2
        MOV CL, [DI]        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX          
        
        SUB BX, 4
                
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX                    
        
        ADD BX, 2         
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX 
        
        ADD BX, 2         
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX 
        
        SUB BX, 0A4H             ; reset position
        
        POP CX
                  
    LOOP SHOW_LOOP
    
    
    MOV CL, [SI]        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX                    
        
        ADD BX, 2
        MOV CL, [SI+1]        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
                  
        ADD BX, 2
        MOV CL, [SI+2]        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX          
        
        SUB BX, 4
ret

LETT1 DB '?'
LETT2 DB '?'
LETT3 DB '?'

ACCEPT_INPUT:
   PUSHF
   MOV AX, CS
   PUSH AX
   CLI 
   
   MOV  AH, 00H
   CALL 0XF400:0X01C0
   
   POPF
   MOV BH, AL

RET

;PMPCMCP 01C0




