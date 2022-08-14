; Programa Plantilla

.data
; Espacio de datos

; VARIABLES DE ENTRADA: NO MODIFICAR ORDEN (Se pueden modificar los valores)
;lista1: .float 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
;lista2: .float 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
;lista3: .float 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
;lista4: .float 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
;lista5: .float 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
lista1: .float 12, 1,15, 1,15,13, 1,14, 1,14,14, 1,13, 1,13,15, 1,12, 1,12
lista2: .float 2,22,25,25, 2, 2,23,24,24, 2, 2,24,23,23, 2, 2,25,22,22, 2
lista3: .float 3, 3,32, 3, 3, 3, 3,33, 3, 3, 3, 3,34, 3, 3, 3, 3,35, 3, 3
lista4: .float 4,45,45,42, 4, 4,44,44,43, 4, 4,43,43,44, 4, 4,42,42,45, 4
lista5: .float 55, 5,55, 5,52,54, 5,54, 5,53,53, 5,53, 5,54,52, 5,52, 5,55
tamano: .word 20
;;;;; VARIABLES DE SALIDA: NO MODIFICAR ORDEN
; m11, m12, m13, m14
; m21, m22, m23, m24
; m31, m32, m33, m34
; m41, m42, m43, m44
M: .float 0.0, 0.0, 0.0, 0.0
.float 0.0, 0.0, 0.0, 0.0
.float 0.0, 0.0, 0.0, 0.0
.float 0.0, 0.0, 0.0, 0.0
checkM: .float 0.0
; Medias
a1: .float 0.0
a2: .float 0.0
a3: .float 0.0
a4: .float 0.0
a5: .float 0.0
checkA: .float 0.0
;;;;; FIN NO MODIFICAR ORDEN

.text

; Code
	.global main

main:
        ; Cargar el numero de elementos para las medias en R1 e iniciar el "contador" a 0.
        
        lw	r3, tamano	; r3   <-- tamaño para la medias
		beqz r3, final
        movi2fp	f25,r3		; f25  <-- Cambio de tipo de registro de Int a float
        cvti2f	f25,f25		; f25  <-- Float(f25)

        addi	r2,r2,#4	; r2   <-- r2(0) + 4
        mult	r1,r3,r2	; r1   <-- r3*r2 (tamano * 4)
        subi	r1,r1,#4	; r1   <-- (tamano * 4) - 4

		add	r4,r0,r1	; r4   <-- r0(0) + r1      
                
	; Cargar lista 1 en registro F1.
	
load1:	; Iterar hasta que el contenido de R1 < 0

	lf	f0, lista1(r1)	; f0 <-- lista1[r1] (r1 76-->0)
	subi	r1, r1, #4	; r1 <-- r1 - 4
	addf	f1, f1, f0      ; f1 <-- f1 + f0
	BNEZ	r1, load1	; While r1 != 0 jump to load1
	
		
	lf	f0, lista1	; f0 <-- lista1[0]
	addf	f1, f1, f0	; f1 <-- f1 + f0

	; Hacer la media de la lista 1 y dejar cargados de nuevo los registros

	divf	f26, f1, f25	; F16 <-- F1/f25
	SF	a1, f26		; a1  <-- F16

	add	r1,r0,r4	; r1  <-- r0(0) + r4( tamano * 4)

load2:	; Iterar hasta que el contenido de R1 < 0

	lf	f2, lista2(r1)	; f2 <-- lista2[r1] (r1 76-->0)
	subi	r1, r1, #4	; r1 <-- r1 - 4
	addf	f3, f3, f2      ; f3 <-- f3 + f2
	BNEZ	r1, load2	; While r1 != 0 jump to load1
	
		
	lf	f2, lista2	; f0 <-- lista2[0]
	addf	f3, f3, f2	; f3 <-- f3 + f2

	; Hacer la media de la lista 2 y dejar cargados de nuevo los registros

	divf	f27, f3, f25	; F17 <-- F3/f25
	SF	a2, f27		; a2  <-- F17

	add	r1,r0,r4	; r1  <-- r0(0) + r4( tamano * 4)

load3:	; Iterar hasta que el contenido de R1 < 0

	lf	f4, lista3(r1)	; f4 <-- lista3[r1] (r1 76-->0)
	subi	r1, r1, #4	; r1 <-- r1 - 4
	addf	f5, f5, f4      ; f5 <-- f5 + f4
	BNEZ	r1, load3	; While r1 != 0 jump to load1
	
		
	lf	f4, lista3	; f0 <-- lista3[0]
	addf	f5, f5, f4	; f5 <-- f5 + f4

	; Hacer la media de la lista 3 y dejar cargados de nuevo los registros

	divf	f28, f5, f25	; f28 <-- f5/f25
	SF	a3, f28		; a3  <-- f28

	add	r1,r0,r4	; r1  <-- r0(0) + r4( tamano * 4)

load4:	; Iterar hasta que el contenido de R1 < 0

	lf	f6, lista4(r1)		; f6 <-- lista4[r1] (r1 76-->0)
	subi	r1, r1, #4		; r1 <-- r1 - 4
	addf	f7, f7, f6      ; f7 <-- f7 + f6
	BNEZ	r1, load4		; While r1 != 0 jump to load1
	
	
	lf	f6, lista4		; f0 <-- lista4[0]
	addf	f7, f7, f6		; f7 <-- f7 + f6

	; Hacer la media de la lista 4 y dejar cargados de nuevo los registros

	divf	f29, f7, f25	; f29 <-- f7/f25
	SF	a4, f29				; a4  <-- f29

	add	r1,r0,r4			; r1  <-- r0(0) + r4( tamano * 4)

load5:	; Iterar hasta que el contenido de R1 < 0

	lf	f8, lista5(r1)		; f8 <-- lista5[r1] (r1 76-->0)
	subi	r1, r1, #4		; r1 <-- r1 - 4
	addf	f9, f9, f8      ; f9 <-- f9 + f8
	BNEZ	r1, load5		; While r1 != 0 jump to load1
	
	
	lf	f8, lista5	; f0 <-- lista5[0]
	addf	f9, f9, f8		; f9 <-- f9 + f8

	; Hacer la media de la lista 5 y dejar cargados de nuevo los registros

	divf	f30, f9, f25	; f30 <-- f9/f25
	SF	a5, f30				; a5  <-- f30

	add	r1, r0, r4			; r1  <-- r0(0) + r4( tamano * 4)

	; comprobar que no haya divisores iguales a 0

	EQF	f30, f12	; compara a5 con 0
	bfpt	final		; salta si es 0

	addf	f24, f26, f28	; a1 + a3 = 0
	EQF	f24, f12	; compara
	bfpt	final		; salta si es 0	

	; calcular checkA
	
	movf	f31, f26	; f31 <-- a1
	multf	f31, f31, f27	; a1 * a2
	multf	f31, f31, f28	; a1 * a2 * a3
	multf	f31, f31, f29	; a1 * a2 * a3 * a4
	multf	f31, f31, f30	; a1 * a2 * a3 * a4 * a5
	SF	checkA, f31	; checkA <-- a1 * a2 * a3 * a4 * a5

	; Calcular el factor de multiplicación

	addf	f0, f27, f29
	addf	f11, f26, f28
	divf	f0, f0, f11

	; Calcular cuadrados y cubos

	multf	f17, f26, f26
	multf	f18, f27, f27	; CUADRADOS
	multf	f19, f28, f28
	multf	f20, f29, f29

	multf	f21, f17, f26
	multf	f22, f18, f27	; CUBOS
	multf	f23, f19, f28
	multf	f24, f20, f29

	; Calcular la matriz M
	
	; COLUMNA 1

	sf	M, f0
	movf	f1, f0		; 
	sf	M + 16, f0
	movf	f5, f0		; 
	sf	M + 32, f0
	movf	f9, f0		; 
	sf	M + 48, f0
	movf	f13, f0	; 
	
	; COLUMNA 3

	multf	f17, f17, f0
	sf	M + 8, f17
	movf	f3, f17		; 

	multf	f18, f18, f0
	sf	M + 24, f18
	movf	f7, f18

	multf	f19, f19, f0
	sf	M + 40, f19
	movf	f11, f19	; 

	multf	f20, f20, f0
	sf	M + 56, f20
	movf	f15, f20	;

	; COLUMNA 4

	multf	f21, f21, f0
	sf	M + 12, f21
	movf	f4, f21		; 

	multf	f22, f22, f0
	sf	M + 28, f22
	movf	f8, f22

	multf	f23, f23, f0
	sf	M + 44, f23
	movf	f12, f23	; 

	multf	f24, f24, f0
	sf	M + 60, f24
	movf	f16, f24	;


	; COLUMNA 2

	multf	f26, f26, f0
	sf	M + 4, f26
	movf	f2, f26		; 

	multf	f27, f27, f0
	sf	M + 20, f27
	movf	f6, f27

	multf	f28, f28, f0
	sf	M + 36, f28
	movf	f10, f28	; 

	multf	f29, f29, f0
	sf	M + 52, f29
	movf	f14, f29	;


	; Calcular checkM

	addi	r7, r0, #60
	subf	f1, f1, f1

calcularCheckM:
	lf	f0, M(r7)		
	subi	r7, r7, #4
	addf	f1, f1, f0
	bnez	r7, calcularCheckM

	lf	f0, M
	addf	f1, f1, f0
	sf	checkM, f1


final:

	trap	0

