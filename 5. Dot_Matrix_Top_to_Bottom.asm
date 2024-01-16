

DSEG    SEGMENT 'DATA'

Dots	 DB	0000001b,	0000001b,	0000001b,	0000001b,	0000001b ;1  
    
    DB	0000010b,	0000010b,	0000010b,	0000010b,	0000010b  ; 2
    
    DB	0000100b,	0000100b,	0000100b,	0000100b,	0000100b  ; 3 
    
    DB	0001000b,	0001000b,	0001000b,	0001000b,	0001000b  ; 4
    
    DB	0010000b,	0010000b,	0010000b,	0010000b,	0010000b  ; 5
    
    DB	0100000b,	0100000b,	0100000b,	0100000b,	0100000b  ; 6
    
    DB	1000000b,	1000000b,	1000000b,	1000000b,	1000000b  ; 7
    
    DB  

	

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


	;MOV DX,2000h	; first DOT MATRIX digit
	 MOV BX, 0

MAINLOOP: 
	MOV SI, 0
	MOV DX,2000h
	MOV CX, 5

NEXT:
	MOV AL,Dots[BX][SI]
	out dx,al
	INC SI
	INC DX
	

	CMP SI, 5
	LOOPNE NEXT
	
	
	
	mov Dots [35][0],cl
	mov Dots [35][1],ch
	
	
	 
	mov Dots [35][2],dl
	mov Dots [35][3],dh
	
	   
    mov CX,004Ch
    mov DX,4B40h
    mov ah,86h
    int 15h
    
    
    mov cl, Dots [35][0]
	mov ch, Dots [35][1]
	
	
	 
	mov dl, Dots [35][2]
	mov dh, Dots [35][3]

	ADD BX, 5
	CMP BX, 35
	JNE MAINLOOP
	
	MOV BX, 0
	JMP MAINLOOP

; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

