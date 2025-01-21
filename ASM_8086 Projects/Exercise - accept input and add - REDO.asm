
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
    MSG1 DB "Input 1st Val: $"
    MSG2 DB "Input 2nd Val: $"
    MSG3 DB "The sum is: $"
.CODE
.STARTUP

    
    MOV DX, offset MSG1    
    MOV AH, 9
    INT 21H
    
    MOV AH, 1H
    INT 21H

ret
