
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
; Florin, Gillian

org 100h

    ;ACCEPT 3 VALUES
    
    MOV AX, 00H
    INT 16H
    
    LEA DI, LETT1
    MOV [DI], AL
    
    
    MOV AX, 00H
    INT 16H
    
    MOV [DI+1], AL
    
    MOV AX, 00H
    INT 16H
    
    MOV [DI+2], AL
    
    MOV [DI+3], 0
    
    
    
    
    ;LOOP
    
    MOV CX, 24
    
    MOV AX, 0B800h          ; position
    MOV DS, AX
    MOV BX, 00F4Eh
    
    
    LEA SI, LETT1
    MOV BX, 00H
    MOV AL, [SI]
    MOV [BX], AX
    ADD BX, 2
    
    MOV AL, [SI+1]
    MOV [BX], AX
    ADD BX, 2
    
    MOV AL, [SI+2]
    MOV [BX], AX
    ADD BX, 2
    
    SHOW_LOOP:
    
        PUSH CX                 ;FREE UP CX
        
        LEA SI, LETT1                        
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
    
    
    ;TOP LAYER
        LEA DI, LETT1                        
        MOV CL, 'G' 
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX                    
        
        ADD BX, 2
                        
        MOV CL, 'E' ;[DI]         
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
                  
        ADD BX, 2
                        
        MOV CL, 'F'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX          
        
        SUB BX, 4    
                                
        MOV CL, ' ' 
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX                    
        
        ADD BX, 2                        
        ;MOV CL, ''         
        ;MOV CH, 0000_0000b      ; color
        ;MOV [BX], CX
                  
        ADD BX, 2                        
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX 
        
        SUB BX, 4
    ;TOP LAYER REMOVED
    
    
    MOV CX, 38
    
    MOV DX, BX
    ADD DX, 04H
    SUB BX, 02H
    
    SIDE_WAYS:
        PUSH CX
        
        LEA DI, LETT1                         ;WRITE SIDEWAYS
        MOV CL, 'G' ;[DI]
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
        
        PUSH BX
        MOV BX, DX
        
                        
        MOV CL, 'F' ;[DI]
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
        
        POP BX
        
        
        MOV CL, ' '                           ;ERASE SIDEWAYS
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX
        
        PUSH BX
        MOV BX, DX
                                
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX
        
        POP BX
        
        SUB BX, 2
        ADD DX, 2
        
        
        POP CX
    
    LOOP SIDE_WAYS
    
    ;WRITE SIDEWAYS FIN STEP    
        LEA DI, LETT1                         
        MOV CL, 'G' ;[DI]
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
        
        PUSH BX
        MOV BX, DX
                       
        MOV CL, 'F' ;[DI]
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
    
    MOV BX, 0000H
    
    MOV CX, 11
    
    BACK_TO_MID:
        PUSH CX
        
        ;LEA DI, LETT1                        
        MOV CL, 'G'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX                    
                     
                     
        ADD BX, 80D
        MOV CL, 'E'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
        
                  
        ADD BX, 78D
        MOV CL, 'F'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX          
        
        SUB BX, 158D
                
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX                    
        
        ADD BX, 80D         
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX 
        
        ADD BX, 78D         
        MOV CL, ' '        
        MOV CH, 0000_0000b      ; color
        MOV [BX], CX 
        
        ADD BX, 2D             ; reset position
        
        POP CX
    LOOP BACK_TO_MID
            
    MOV CL, 'G'        
    MOV CH, 0010_1111b      ; color
    MOV [BX], CX                    
                 
                     
    ADD BX, 80D
    MOV CL, 'E'        
    MOV CH, 0010_1111b      ; color
    MOV [BX], CX
    
                  
    ADD BX, 78D
    MOV CL, 'F'        
    MOV CH, 0010_1111b      ; color
    MOV [BX], CX
    
    
ret

LETT1 DB 4H DUP(?)






