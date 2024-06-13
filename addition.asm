.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter first number: $'
    MSG2 DB 0DH, 0AH, 'Enter second number: $'
    MSG3 DB 0DH, 0AH, 'The sum is: $'
    NEWLINE DB 0DH, 0AH, '$'
    NUM1 DB ?
    NUM2 DB ?
    RESULT DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display MSG1
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Read first number
    MOV AH, 01H
    INT 21H
    SUB AL, '0'    ; Convert ASCII to number
    MOV NUM1, AL

    ; Display MSG2
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Read second number
    MOV AH, 01H
    INT 21H
    SUB AL, '0'    ; Convert ASCII to number
    MOV NUM2, AL

    ; Add numbers
    MOV AL, NUM1
    ADD AL, NUM2
    MOV RESULT, AL

    ; Display MSG3
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

    ; Convert result to ASCII
    ADD RESULT, '0'
    MOV DL, RESULT

    ; Display result
    MOV AH, 02H
    INT 21H

    ; Display new line
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H

    ; Exit to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
