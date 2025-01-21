
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
; Florin, Gillian

org 100h

; add your code here
    
    MOV CX, 998
    
    
    MOV AX, 0B800h ;0B86Eh          ; position
    MOV DS, AX  
               
               
    SHOW_LOOPB:
    
    
        PUSH CX
               
                
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
        
        SUB BX, 4               ; reset position
                     
          
        ADD BX, 2         
        MOV CL, 'G'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX                    
        
        ADD BX, 2
        MOV CL, 'E'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX
                  
        ADD BX, 2
        MOV CL, 'F'        
        MOV CH, 0010_1111b      ; color
        MOV [BX], CX          
        
        SUB BX, 4
        
                  
        POP CX
                  
    LOOP SHOW_LOOPB
    
ret




