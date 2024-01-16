

DSEG    SEGMENT 'DATA'

	

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*******************************************

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
	MOV     AX, DSEG
    	MOV     DS, AX
    	MOV     ES, AX


	

MAINLOOP:
   
	MOV DX,2000h	; first DOT MATRIX digit
	MOV SI, 0
	MOV CX, 5

NEXT:
	
	MOV AL,1111111b
	out dx,al
	
	
	;Delay 5 Sec
	 
	mov bx,cx 
	mov si,dx   
    mov CX,004Ch
    mov DX,4B40h
    mov ah,86h
    int 15h
    mov cx,bx
    MOV DX,SI
	 
	

	MOV AL,0000000b
	out dx,al 

	;INC SI
	INC DX
	
	

	LOOP NEXT

	JMP MAINLOOP
	
 
    
    	

; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

