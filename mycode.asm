.model small
.stack
.data 

;Worood Assi
;#1210412

;A)Declare an array of at least 10 signed integer numbers (8-bit) in the memory with initial values. 
myArray DB 34, -56, 27, -5, 38, 5, -46, -2, 17, -1 

; Initialize SUM to 0
SUM DB 0  

; Initialize P_SUM to 0
P_SUM DB 0  

; Initialize ZCC to 0
ZCC DB 0 


.code
.startup


;B)Find the arithmetic sum of all elements of the array and store it in the memory
MOV CX, 10
MOV SI, 0 

myLoop:
    MOV AL, [myArray + SI]
    ADD [SUM], AL
    INC SI
    LOOP myLoop 

;store SUM value in bl register to show it   
MOV BL,[SUM]    ;(11 = 0B H)


;C)Find the sum of the elements that are greater than zero in the array & Store it in a memory variable
MOV CX,10
MOV SI, 0

myLoop2:
    MOV AL, [myArray + SI] 
    INC SI
    CMP AL,0  ;Compare the number if it is less than zero or greater
    JL lab1 
    ADD [P_SUM], AL
    
    lab1:
       LOOP myLoop2 

;store P_SUM value in bh register to show it   
MOV BH,[P_SUM]    ;(121 = 79 H)


;D)) Find the Zero-Crossing Count (ZCC) of the array elements. The ZCC is computed by counting the 
;    number of times the successive samples of the array change their signs.
;    Store the ZCC value in the memory variable called ZCC 
MOV CX, 9
MOV SI, 0  



myLoop3:
    MOV AL, [myArray + SI]
    MOV AH, [myArray + SI + 1]
    XOR AL, AH
    JNS changeSign
    INC [ZCC]  ; Increment ZCC count when signs change 
    
changeSign:
    INC SI
    LOOP myLoop3 

;store ZCC value in dl register to show it 
MOV DL,[ZCC]    ;(7 = 07 H)

.exit
end
