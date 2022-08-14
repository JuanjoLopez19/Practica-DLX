; Trabajo final DLX -  Pablo Santos Blázquez y Juan José López Gómez.

.data
; Espacio de datos

; VARIABLES DE ENTRADA: NO MODIFICAR ORDEN (Se pueden modificar los valores)
lista1: .float 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
lista2: .float 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
lista3: .float 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
;lista3: .float -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
lista4: .float 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
lista5: .float 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
;lista5: .float 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;lista1: .float 12, 1,15, 1,15,13, 1,14, 1,14,14, 1,13, 1,13,15, 1,12, 1,12
;lista2: .float 2,22,25,25, 2, 2,23,24,24, 2, 2,24,23,23, 2, 2,25,22,22, 2
;lista3: .float 3, 3,32, 3, 3, 3, 3,33, 3, 3, 3, 3,34, 3, 3, 3, 3,35, 3, 3
;lista4: .float 4,45,45,42, 4, 4,44,44,43, 4, 4,43,43,44, 4, 4,42,42,45, 4
;lista5: .float 55, 5,55, 5,52,54, 5,54, 5,53,53, 5,53, 5,54,52, 5,52, 5,55
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
        
load:	
	lw	r3, tamano
	lf	f0, lista1

	SEQI	r6, r3, #5
	beqz	r3, final
	BNEZ	r6, tamano5 

	SEQI	r6, r3, #10
	addi	r5, r5, #1		; r5   <-- 1 para el numerador
	BNEZ	r6, tamano10

	SEQI	r6, r3, #15
	lf	f1, lista1 + 4
	BNEZ	r6, tamano15 


tamano20:

	movi2fp	f25, r3		; f25  <-- Cambio de tipo de registro de Int a float
	movi2fp f26, r5		; f26  <-- Cambio de tipo de registro de Int a float

	cvti2f	f25, f25	; f25  <-- Float(f25)
	cvti2f	f26, f26	; f26  <-- Float(f26)

	addf	f2, f0, f1

	lf	f0, lista1 + 8
	lf	f1, lista1 + 12
	addf	f2, f2, f0

	divf	f31, f26, f25

	lf	f0, lista1 + 16
	addf	f2, f2, f1
	lf	f1, lista1 + 20
	addf	f2, f2, f0
	lf	f0, lista1 + 24
	addf	f2, f2, f1
	lf	f1, lista1 + 28
	addf	f2, f2, f0
	lf	f0, lista1 + 32
	addf	f2, f2, f1
	lf	f1, lista1 + 36
	addf	f2, f2, f0
	lf	f0, lista1 + 40
	addf	f2, f2, f1
	lf	f1, lista1 + 44
	addf	f2, f2, f0
	lf	f0, lista1 + 48
	addf	f2, f2, f1
	lf	f1, lista1 + 52
	addf	f2, f2, f0
	lf	f0, lista1 + 56
	addf	f2, f2, f1
	lf	f1, lista1 + 60
	addf	f2, f2, f0
	lf	f0, lista1 + 64
	addf	f2, f2, f1
	lf	f1, lista1 + 68
	addf	f2, f2, f0
	lf	f0, lista1 + 72
	addf	f2, f2, f1
	lf	f1, lista1 + 76
	addf	f2, f2, f0

t20_sumaLista2:

	lf	f0, lista2 

	addf	f2, f2, f1	; Último valor del anterior

	lf	f1, lista2 + 4
	addf	f3, f3, f0

	multf	f26, f2, f31	; a1

	lf	f0, lista2 + 8
	addf	f3, f3, f1
	lf	f1, lista2 + 12
	addf	f3, f3, f0

	multf	f17, f26, f26	; a1^2

	lf	f0, lista2 + 16
	addf	f3, f3, f1
	lf	f1, lista2 + 20
	addf	f3, f3, f0

	multf	f21, f17, f26	; a1^3

	lf	f0, lista2 + 24
	addf	f3, f3, f1
	lf	f1, lista2 + 28
	addf	f3, f3, f0
	lf	f0, lista2 + 32
	addf	f3, f3, f1
	lf	f1, lista2 + 36
	addf	f3, f3, f0
	lf	f0, lista2 + 40
	addf	f3, f3, f1
	lf	f1, lista2 + 44
	addf	f3, f3, f0
	lf	f0, lista2 + 48
	addf	f3, f3, f1
	lf	f1, lista2 + 52
	addf	f3, f3, f0
	lf	f0, lista2 + 56
	addf	f3, f3, f1
	lf	f1, lista2 + 60
	addf	f3, f3, f0
	lf	f0, lista2 + 64
	addf	f3, f3, f1
	lf	f1, lista2 + 68
	addf	f3, f3, f0
	lf	f0, lista2 + 72
	addf	f3, f3, f1
	lf	f1, lista2 + 76
	addf	f3, f3, f0

t20_sumaLista3:

	lf	f0, lista3 

	addf	f3, f3, f1	; Último valor del anterior

	lf	f1, lista3 + 4
	addf	f4, f4, f0

	multf	f27, f3, f31	; a2

	lf	f0, lista3 + 8
	addf	f4, f4, f1
	lf	f1, lista3 + 12
	addf	f4, f4, f0

	multf	f18, f27, f27	;a2^2

	lf	f0, lista3 + 16
	addf	f4, f4, f1
	lf	f1, lista3 + 20
	addf	f4, f4, f0

	multf	f22, f18, f27	;a2^3

	lf	f0, lista3 + 24
	addf	f4, f4, f1
	lf	f1, lista3 + 28
	addf	f4, f4, f0

	multf	f25, f26, f27	; checkA = a1 * a2

	lf	f0, lista3 + 32
	addf	f4, f4, f1
	lf	f1, lista3 + 36
	addf	f4, f4, f0
	lf	f0, lista3 + 40
	addf	f4, f4, f1
	lf	f1, lista3 + 44
	addf	f4, f4, f0
	lf	f0, lista3 + 48
	addf	f4, f4, f1
	lf	f1, lista3 + 52
	addf	f4, f4, f0
	lf	f0, lista3 + 56
	addf	f4, f4, f1
	lf	f1, lista3 + 60
	addf	f4, f4, f0
	lf	f0, lista3 + 64
	addf	f4, f4, f1
	lf	f1, lista3 + 68
	addf	f4, f4, f0
	lf	f0, lista3 + 72
	addf	f4, f4, f1
	lf	f1, lista3 + 76
	addf	f4, f4, f0

t20_sumaLista4:

	lf	f0, lista4 

	addf	f4, f4, f1	; Último valor del anterior

	lf	f1, lista4 + 4
	addf	f5, f5, f0

	multf	f28, f4, f31	; a3

	lf	f0, lista4 + 8
	addf	f5, f5, f1
	lf	f1, lista4 + 12
	addf	f5, f5, f0

	multf	f19, f28, f28	; a3^2

	lf	f0, lista4 + 16
	addf	f5, f5, f1
	lf	f1, lista4 + 20
	addf	f5, f5, f0

	multf	f23, f28, f19	; a3^3

	lf	f0, lista4 + 24
	addf	f5, f5, f1
	lf	f1, lista4 + 28
	addf	f5, f5, f0

	multf	f25, f25, f28	; checkA = a1 * a2 * a3

	lf	f0, lista4 + 32
	addf	f5, f5, f1
	lf	f1, lista4 + 36
	addf	f5, f5, f0
	lf	f0, lista4 + 40
	addf	f5, f5, f1
	lf	f1, lista4 + 44
	addf	f5, f5, f0
	lf	f0, lista4 + 48
	addf	f5, f5, f1
	lf	f1, lista4 + 52
	addf	f5, f5, f0
	lf	f0, lista4 + 56
	addf	f5, f5, f1
	lf	f1, lista4 + 60
	addf	f5, f5, f0
	lf	f0, lista4 + 64
	addf	f5, f5, f1
	lf	f1, lista4 + 68
	addf	f5, f5, f0
	lf	f0, lista4 + 72
	addf	f5, f5, f1
	lf	f1, lista4 + 76
	addf	f5, f5, f0

t20_sumaLista5:

	lf	f0, lista5 

	addf	f5, f5, f1	; Último valor del anterior

	lf	f1, lista5 + 4
	addf	f6, f6, f0

	multf	f29, f5, f31	; a4

	lf	f0, lista5 + 8
	addf	f6, f6, f1
	lf	f1, lista5 + 12
	addf	f8, f26, f28	; a1 + a3
	
	multf	f20, f29, f29	; a4^2

	addf	f6, f6, f0
	eqf	f8, f9
	addf	f10, f27, f29	; a2 + a4
	bfpt	final		; si el denominador es 0, salta al final.
	
	divf	f11, f10, f8	; factor de multiplicación

	multf	f24, f20, f29	; a4^3

	lf	f0, lista5 + 16
	addf	f6, f6, f1
	lf	f7, lista5 + 20	; se usa f7 para no dejar un ciclo
	addf	f6, f6, f0
	lf	f0, lista5 + 24  

	multf	f25, f25, f29	; checkA = a1 * a2 * a3 * a4

	addf	f6, f6, f7
	lf	f1, lista5 + 28
	addf	f6, f6, f0	; Dejamos 5 en vez de 4 por Structural Stall
	lf	f0, lista5 + 32

	addf	f6, f6, f1
	lf	f1, lista5 + 36
	addf	f6, f6, f0

	lf	f0, lista5 + 40
	addf	f6, f6, f1
	lf	f1, lista5 + 44

	multf	f2, f26, f11	; a1 * m

	lf	f13, lista5 + 48		;; f0 -> f13
	addf	f6, f6, f0
	lf	f14, lista5 + 52		;; f1 -> f14
	addf	f6, f6, f1
	
	multf	f3, f27, f11	; a2 * m

	lf	f0, lista5 + 56
	addf	f6, f6, f13		;; f0 -> f13
	lf	f1, lista5 + 60
	addf	f6, f6, f14		;; f1 -> f14

	multf	f4, f28, f11	; a3 * m

	lf	f13, lista5 + 64		;; f0 -> f13
	addf	f6, f6, f0		
	lf	f14, lista5 + 68		;; f1 -> f14
	addf	f6, f6, f1
	
	multf	f5, f29, f11	; a4 * m

	lf	f0, lista5 + 72
	addf	f6, f6, f13		;; f0 -> f13
	lf	f1, lista5 + 76
	addf	f6, f6, f14		;; f1 -> f14
	
	multf	f17, f17, f11	; a1^2 * m

	sf	a1, f26
	addf	f6, f6, f0
	sf	a2, f27
	addf	f6, f6, f1
	
	multf	f18, f18, f11	; a2^2 * m

	sf	a3, f28 
	addf	f12, f12, f11	; m11
	sf	a4, f29 
	addf	f12, f12, f11	; m21
	
	multf	f30, f6, f31	; a5

	sf	M, f11
	addf	f12, f12, f11	; m31	
	sf	M + 16, f11 
	addf	f12, f12, f11	; m41

	multf	f25, f25, f30	; checkA = a1 * a2 * a3 * a4 * a5

	sf	M + 32, f11
	addf	f12, f12, f2	; m12
	sf	M + 48, f11
	addf	f12, f12, f3	; m22

	multf	f19, f19, f11	; a3^2 * m

	eqf	f30, f9
	addf	f12, f12, f4	; m32
	bfpt	final
	addf	f12, f12, f5	; m42

	multf	f20, f20, f11	; a4^2 * m

	sf	a5, f30
	addf	f12, f12, f17	; m13	
	sf	M + 4,  f2
	addf	f12, f12, f18	; m23	

	multf	f21, f21, f11	; a1^3*m

	sf	M + 20, f3
	addf	f12, f12, f19	; m33	
	sf	M + 36, f4
	addf	f12, f12, f20	; m43	

	multf	f22, f22, f11	; a2^3*m

	sf	M + 52, f5
	sf	M + 8,  f17 
	sf	M + 24, f18 
	addf	f12, f12, f21	; m14	

	multf	f23, f23, f11	; a3^3*m

	sf	M + 40, f19 
	sf	M + 56, f20 
	sf	M + 12, f21
	addf	f12, f12, f22	; m24

	multf	f24, f24, f11	; a4^3*m

	sf	M + 28, f22
	sf	checkA, f25
	addf	f12, f12, f23	; m34
	sf	M + 44, f23
	
	addf	f12, f12, f24
	sf	M + 60, f24
	sf	checkM, f12

	trap	0

tamano15:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	movi2fp	f25, r3		; f25  <-- Cambio de tipo de registro de Int a float
	movi2fp f26, r5		; f26  <-- Cambio de tipo de registro de Int a float

	cvti2f	f25, f25	; f25  <-- Float(f25)
	cvti2f	f26, f26	; f26  <-- Float(f26)

	addf	f2, f0, f1

	lf	f0, lista1 + 8
	lf	f1, lista1 + 12
	addf	f2, f2, f0

	divf	f31, f26, f25

	lf	f0, lista1 + 16
	addf	f2, f2, f1
	lf	f1, lista1 + 20
	addf	f2, f2, f0
	lf	f0, lista1 + 24
	addf	f2, f2, f1
	lf	f1, lista1 + 28
	addf	f2, f2, f0
	lf	f0, lista1 + 32
	addf	f2, f2, f1
	lf	f1, lista1 + 36
	addf	f2, f2, f0
	lf	f0, lista1 + 40
	addf	f2, f2, f1
	lf	f1, lista1 + 44
	addf	f2, f2, f0
	lf	f0, lista1 + 48
	addf	f2, f2, f1
	lf	f1, lista1 + 52
	addf	f2, f2, f0
	lf	f0, lista1 + 56
	addf	f2, f2, f1

t15_sumaLista2:

	lf	f1, lista2 

	addf	f2, f2, f0	; Último valor del anterior

	lf	f0, lista2 + 4
	addf	f3, f3, f1

	multf	f26, f2, f31	; a1

	lf	f1, lista2 + 8
	addf	f3, f3, f0
	lf	f0, lista2 + 12
	addf	f3, f3, f1

	multf	f17, f26, f26	; a1^2

	lf	f1, lista2 + 16
	addf	f3, f3, f0
	lf	f0, lista2 + 20
	addf	f3, f3, f1

	multf	f21, f17, f26	; a1^3

	lf	f1, lista2 + 24
	addf	f3, f3, f0
	lf	f0, lista2 + 28
	addf	f3, f3, f1
	lf	f1, lista2 + 32
	addf	f3, f3, f0
	lf	f0, lista2 + 36
	addf	f3, f3, f1
	lf	f1, lista2 + 40
	addf	f3, f3, f0
	lf	f0, lista2 + 44
	addf	f3, f3, f1
	lf	f1, lista2 + 48
	addf	f3, f3, f0
	lf	f0, lista2 + 52
	addf	f3, f3, f1
	lf	f1, lista2 + 56
	addf	f3, f3, f0


t15_sumaLista3:

	lf	f0, lista3 

	addf	f3, f3, f1	; Último valor del anterior

	lf	f1, lista3 + 4
	addf	f4, f4, f0

	multf	f27, f3, f31	; a2

	lf	f0, lista3 + 8
	addf	f4, f4, f1
	lf	f1, lista3 + 12
	addf	f4, f4, f0

	multf	f18, f27, f27	;a2^2

	lf	f0, lista3 + 16
	addf	f4, f4, f1
	lf	f1, lista3 + 20
	addf	f4, f4, f0

	multf	f22, f18, f27	;a2^3

	lf	f0, lista3 + 24
	addf	f4, f4, f1
	lf	f1, lista3 + 28
	addf	f4, f4, f0

	multf	f25, f26, f27	; checkA = a1 * a2

	lf	f0, lista3 + 32
	addf	f4, f4, f1
	lf	f1, lista3 + 36
	addf	f4, f4, f0
	lf	f0, lista3 + 40
	addf	f4, f4, f1
	lf	f1, lista3 + 44
	addf	f4, f4, f0
	lf	f0, lista3 + 48
	addf	f4, f4, f1
	lf	f1, lista3 + 52
	addf	f4, f4, f0
	lf	f0, lista3 + 56
	addf	f4, f4, f1

t15_sumaLista4:

	lf	f1, lista4 

	addf	f4, f4, f0	; Último valor del anterior

	lf	f0, lista4 + 4
	addf	f5, f5, f1

	multf	f28, f4, f31	; a3

	lf	f1, lista4 + 8
	addf	f5, f5, f0
	lf	f0, lista4 + 12
	addf	f5, f5, f1

	multf	f19, f28, f28	; a3^2

	lf	f1, lista4 + 16
	addf	f5, f5, f0
	lf	f0, lista4 + 20
	addf	f5, f5, f1

	multf	f23, f28, f19	; a3^3

	lf	f1, lista4 + 24
	addf	f5, f5, f0
	lf	f0, lista4 + 28
	addf	f5, f5, f1

	multf	f25, f25, f28	; checkA = a1 * a2 * a3

	lf	f1, lista4 + 32
	addf	f5, f5, f0
	lf	f0, lista4 + 36
	addf	f5, f5, f1
	lf	f1, lista4 + 40
	addf	f5, f5, f0
	lf	f0, lista4 + 44
	addf	f5, f5, f1
	lf	f1, lista4 + 48
	addf	f5, f5, f0
	lf	f0, lista4 + 52
	addf	f5, f5, f1
	lf	f1, lista4 + 56
	addf	f5, f5, f0

t15_sumaLista5:

	lf	f0, lista5 

	addf	f5, f5, f1	; Último valor del anterior

	lf	f1, lista5 + 4
	addf	f6, f6, f0

	multf	f29, f5, f31	; a4

	lf	f0, lista5 + 8
	addf	f6, f6, f1
	lf	f1, lista5 + 12
	addf	f8, f26, f28	; a1 + a3
	
	multf	f20, f29, f29	; a4^2

	addf	f6, f6, f0
	eqf	f8, f9
	addf	f10, f27, f29	; a2 + a4
	bfpt	final		; si el denomiador es 0, salta al final.
	
	divf	f11, f10, f8	; factor de multiplicación

	multf	f24, f20, f29	; a4^3

	lf	f0, lista5 + 16
	addf	f6, f6, f1
	lf	f7, lista5 + 20	; se usa f7 para no dejar un ciclo
	addf	f6, f6, f0

	multf	f25, f25, f29	; checkA = a1 * a2 * a3 * a4

	lf	f0, lista5 + 24
	addf	f6, f6, f7
	lf	f1, lista5 + 28
	addf	f6, f6, f0	; Dejamos 5 en vez de 4 por Structural Stall

	lf	f0, lista5 + 32
	addf	f6, f6, f1
	lf	f1, lista5 + 36
	addf	f6, f6, f0

	lf	f0, lista5 + 40
	addf	f6, f6, f1
	lf	f1, lista5 + 44

	multf	f2, f26, f11	; a1 * m

	addf	f6, f6, f0
	lf	f0, lista5 + 48
	addf	f6, f6, f1
	lf	f1, lista5 + 52

	multf	f3, f27, f11	; a2 * m

	addf	f6, f6, f0
	lf	f0, lista5 + 56
	addf	f6, f6, f1
	sf	a1, f26

	multf	f4, f28, f11	; a3 * m

	addf	f6, f6, f0	; ultima de lista5
	sf	a2, f27
	addf	f12, f12, f11	; m11
	sf	a3, f28

	multf	f30, f6, f31	; a5

	addf	f12, f12, f11	; m21
	sf	a4, f29 
	addf	f12, f12, f11	; m31
	sf	M, f11

	multf	f5, f29, f11	; a4 * m

	addf	f12, f12, f11	; m41
	sf	M + 16, f11
	addf	f12, f12, f2	; m12
	sf	M + 32, f11	

	multf	f17, f17, f11	; a1^2 * m

	addf	f12, f12, f3	; m22
	sf	M + 48, f11
	addf	f12, f12, f4	; m32
	eqf	f30, f9

	multf	f18, f18, f11	; a2^2 * m

	addf	f12, f12, f5	; m42
	bfpt	final
	addf	f12, f12, f17	; m13
	sf	a5, f30 

	multf	f19, f19, f11	; a3^2 * m

	addf	f12, f12, f18	; m23
	sf	M + 4,  f2 
	sf	M + 20, f3
	sf	M + 36, f4
	
	multf	f20, f20, f11	; a4^2 * m

	addf	f12, f12, f19	; m33
	sf	M + 52, f5 
	sf	M + 8,  f17 
	sf	M + 24, f18 
	
	multf	f21, f21, f11	; a1^3*m

	addf	f12, f12, f20	; m43
	sf	M + 40, f19 
	sf	M + 56, f20 
	nop

	multf	f22, f22, f11	; a2^3*m

	addf	f12, f12, f21	; m14
	sf	M + 12, f21
	nop
	nop

	multf	f23, f23, f11	; a3^3*m

	addf	f12, f12, f22	; m24
	sf	M + 28, f22
	nop
	nop

	multf	f24, f24, f11	; a4^3*m

	addf	f12, f12, f23	; m34
	sf	M + 44, f23
	nop
	nop

	multf	f25, f25, f30	; checkA = a1 * a2 * a3 * a4 * a5

	addf	f12, f12, f24
	sf	M + 60, f24
	sf	checkM, f12
	nop
	
	sf	checkA, f25

	trap	0



;;;;;;;;;;;;;;;;;;;

tamano10:
	lf	f1, lista1 + 4

	movi2fp	f25, r3		; f25  <-- Cambio de tipo de registro de Int a float
	movi2fp f26, r5		; f26  <-- Cambio de tipo de registro de Int a float

    cvti2f	f25, f25	; f25  <-- Float(f25)
	cvti2f	f26, f26	; f26  <-- Float(f26)

	divf	f31, f26, f25

	addf	f2, f0, f1

t10_carga1:
	lf	f0, lista1 + 8
	lf	f1, lista1 + 12
	addf	f2, f2, f0
	lf	f0, lista1 + 16
	addf	f2, f2, f1
	lf	f1, lista1 + 20
	addf	f2, f2, f0
	lf	f0, lista1 + 24
	addf	f2, f2, f1
	lf	f1, lista1 + 28
	addf	f2, f2, f0
	lf	f0, lista1 + 32
	addf	f2, f2, f1
	lf	f1, lista1 + 36
	addf	f2, f2, f0
	
t10_carga2:
	lf	f0, lista2 
	addf	f2, f2, f1	; Último de la anterior lista
	lf	f1, lista2 + 4

	multf	f26, f2, f31	; a1

	addf	f3, f3, f0 
	lf	f0, lista2 + 8
	addf	f3, f3, f1
	lf	f1, lista2 + 12

	multf	f17, f26, f26	; a1^2

	addf	f3, f3, f0 
	lf	f0, lista2 + 16
	addf	f3, f3, f1
	lf	f1, lista2 + 20

	multf	f21, f17, f26	; a1^3

	addf	f3, f3, f0 
	lf	f0, lista2 + 24
	addf	f3, f3, f1
	lf	f1, lista2 + 28
	addf	f3, f3, f0 
	lf	f0, lista2 + 32
	addf	f3, f3, f1
	lf	f1, lista2 + 36
	addf	f3, f3, f0 

t10_carga3:
	lf	f0, lista3
	addf	f3, f3, f1	; Último de la anterior lista
	lf	f1, lista3 + 4

	multf	f27, f3, f31	; a2

	addf	f4, f4, f0 
	lf	f0, lista3 + 8
	addf	f4, f4, f1
	lf	f1, lista3 + 12	

	multf	f18, f27, f27	; a2^2

	addf	f4, f4, f0 
	lf	f0, lista3 + 16
	addf	f4, f4, f1
	lf	f1, lista3 + 20

	multf	f22, f27, f18	; a2^3

	addf	f4, f4, f0 
	lf	f0, lista3 + 24
	addf	f4, f4, f1
	lf	f1, lista3 + 28

	multf	f25, f26, f27	; checkA = a1 * a2

	addf	f4, f4, f0 
	lf	f0, lista3 + 32
	addf	f4, f4, f1
	lf	f1, lista3 + 36
	addf	f4, f4, f0

t10_carga4:
	lf	f0, lista4
	addf	f4, f4, f1 ; Último de la anterior lista
	lf	f1, lista4 + 4

	multf	f28, f4, f31	; a3

	addf	f5, f5, f0 
	lf	f0, lista4 + 8
	addf	f5, f5, f1
	lf	f1, lista4 + 12

	multf	f19, f28, f28	; a3^2

	addf	f5, f5, f0 
	lf	f0, lista4 + 16
	addf	f5, f5, f1
	lf	f1, lista4 + 20

	multf	f23, f28, f19	; a3^3

	addf	f5, f5, f0 
	lf	f0, lista4 + 24
	addf	f5, f5, f1
	lf	f1, lista4 + 28

	multf	f25, f25, f28	; checkA = a1 * a2 * a3

	addf	f5, f5, f0 
	lf 	f0, lista4 + 32
	addf	f5, f5, f1
	lf	f1, lista4 + 36
	addf	f5, f5, f0

t10_carga5:
	lf	f0, lista5
	addf	f5, f5, f1	; Último de la anterior lista
	lf	f1, lista5 + 4

	multf	f29, f5, f31	; a4

	addf	f8, f26, f28	; a1 + a3
	addf	f6, f6, f0 
	lf	f0, lista5 + 8
	addf	f6, f6, f1
	
	multf	f20, f29, f29	; a4^2

	addf	f10, f27, f29	; a2 + a4
	eqf	f8, f9
	bfpt	final		; si el denomiador es 0, salta al final.

	divf	f11, f10, f8	; factor de multiplicación

	lf	f1, lista5 + 12
	addf	f6, f6, f0 
	lf	f0, lista5 + 16
	addf	f6, f6, f1
	multf	f24, f29, f20	; a4^3

	lf	f1, lista5 + 20
	addf	f6, f6, f0 
	lf	f0, lista5 + 24
	addf	f6, f6, f1

	multf	f25, f25, f29	; checkA = a1 * a2 * a3 * a4

	lf	f1, lista5 + 28
	addf	f6, f6, f0 
	lf	f0, lista5 + 32
	addf	f6, f6, f1
	lf	f1, lista5 + 36
	addf	f6, f6, f0 

t10_calcM:
	multf	f2, f26, f11	; a1 * m

	addf	f6, f6, f1	; Último de la anterior lista
	sf	M, f11
	addf	f12, f12, f11	; m11
	sf	M + 16, f11

	multf	f30, f6, f31	; a5

	addf	f12, f12, f11	; m21
	sf	M + 32, f11
	addf	f12, f12, f11	; m31
	sf	M + 48, f11

	multf	f25, f25, f30	; checkA = a1 * a2 * a3 * a4 * a5 

	addf	f12, f12, f11	; m41
	eqf	f30, f9
	addf	f12, f12, f2	; m12
	bfpt	final
	
	multf	f3, f27, f11	; a2 * m

	sf	M + 4, f2
	sf	a1, f26
	sf	a2, f27
	sf	checkA, f25

	multf	f4, f28, f11	; a3 * m

	addf	f12, f12, f3	; m22
	sf	M + 20, f3
	sf	a3, f28
	sf	a4, f29

	multf	f5, f29, f11	; a4 * m

	addf	f12, f12, f4	; m32
	sf	M + 36, f4
	sf	a5, f30
	nop

	multf	f17, f17, f11	; a1^2 * m

	addf	f12, f12, f5	; m42
	sf	M + 52, f5
	nop
	nop

	multf	f18, f18, f11	; a2^2 * m

	addf	f12, f12, f17	; m13
	sf	M + 8, f17
	nop
	nop

	multf	f19, f19, f11	; a3^2 * m

	addf	f12, f12, f18	; m23
	sf	M + 24, f18
	nop
	nop

	multf	f20, f20, f11	; a4^2 * m

	addf	f12, f12, f19	; m33
	sf	M + 40, f19
	nop
	nop

	multf	f21, f21, f11	; a1^3 * m

	addf	f12, f12, f20	; m43
	sf	M + 56, f20
	nop
	nop

	multf	f22, f22, f11	; a2^3 * m

	addf	f12, f12, f21	; m14
	sf	M + 12, f21
	nop
	nop

	multf	f23, f23, f11	; a3^3 * m

	addf	f12, f12, f22	; m24
	sf	M + 28, f22
	nop
	nop

	multf	f24, f24, f11	; a4^3 * m

	addf	f12, f12, f23	; m34
	sf	M + 44, f23
	nop
	nop

	addf	f12, f12, f24	; m44
	sf	M + 60, f24
	sf	checkM, f12

	trap 0 

tamano5:

	addi	r5, r5, #1		; r5   <-- 1 para el numerador
	lf	f1, lista1 + 4

	movi2fp	f25, r3		; f25  <-- Cambio de tipo de registro de Int a float
	movi2fp f26, r5		; f26  <-- Cambio de tipo de registro de Int a float

	cvti2f	f25, f25	; f25  <-- Float(f25)
	cvti2f	f26, f26	; f26  <-- Float(f26)

	divf	f31, f26, f25

	addf	f2, f0, f1

	lf	f0, lista1 + 8
	lf	f1, lista1 + 12
	addf	f2, f2, f0

	lf	f0, lista1 + 16
	addf	f2, f2, f1

carga_lista2:

	lf	f1, lista2 
	addf	f2, f2, f0	; Último valor del anterior

	lf	f0, lista2 + 4
	addf	f3, f3, f1

	lf	f1, lista2 + 8
	addf	f3, f3, f0

	lf	f0, lista2 + 12
	addf	f3, f3, f1

	lf	f1, lista2 + 16
	addf	f3, f3, f0

carga_lista3:

	lf	f0, lista3

	multf	f26, f2, f31 ; a1

	addf	f3, f3, f1
	lf	f1, lista3 + 4
	addf	f4, f4, f0
	lf	f0, lista3 + 8

	multf	f27, f3, f31 ; a2

	addf	f4, f4, f1
	lf	f1, lista3 + 12
	addf	f4, f4, f0
	lf	f0, lista3 + 16

	multf	f25, f26, f27	; checkA = a1 * a2

	addf	f4, f4, f1

carga_lista4:

	lf	f1, lista4
	addf	f4, f4, f0
	lf	f0, lista4 + 4

	multf	f28, f4, f31 ; a3

	addf	f5, f5, f1
	lf	f1, lista4 + 8
	addf	f5, f5, f0
	lf	f0, lista4 + 12

	addf	f8, f26, f28	; a1 + a3

	multf	f25, f25, f28	; checkA = a1 * a2 * a3

	eqf	f8, f9
	addf	f5, f5, f1
	lf	f1, lista4 + 16
	addf	f5, f5, f0

carga_lista5:

	multf	f17, f26, f26	; a1^2

	lf	f0, lista5
	addf	f5, f5, f1
	lf	f1, lista5 + 4
	addf	f6, f6, f0

	multf	f29, f5, f31	; a4

	lf	f0, lista5 + 8
	addf	f6, f6, f1
	lf	f1, lista5 + 12
	addf	f6, f6, f0

	multf	f21, f17, f26	; a1^3

	lf	f0, lista5 + 16
	addf	f10, f27, f29	; a2 + a4

	bfpt	final		; si el denomiador es 0, salta al final.

	divf	f11, f10, f8	; factor de multiplicación

	multf	f18, f27, f27	; a2^2

	addf	f6, f6, f1
	sf	a2, f27
	addf	f6, f6, f0
	sf	a1, f26

	multf	f30, f6, f31	; a5

	sf	a3, f28
	sf	a4, f29
	nop
	nop

	multf	f25, f25, f29	; checkA = a1 * a2 * a3 * a4 
	
	sf	a5, f30
	nop
	nop
	nop

	multf	f25, f25, f30	; checkA = a1 * a2 * a3 * a4 * a5

	nop
	addf	f12, f12, f11	; m11
	sf	M, f11
	addf	f12, f12, f11	; m21

	multf	f22, f18, f27	; a2^3

	sf	M + 16, f11
	addf	f12, f12, f11	; m31
	sf	checkA, f25
	addf	f12, f12, f11	; m41

	multf	f2, f26, f11	; a1*m

	sf	M + 32, f11
	sf	M + 48, f11
	nop
	nop

	multf	f19, f28, f28	; a3^2

	addf	f12, f12, f2	; m12
	sf	M + 4,	f2
	nop
	nop

	multf	f23, f28, f19	; a3^3

	eqf	f30, f9
	nop
	bfpt	final
	nop

	multf	f20, f29, f29	; a4^2

	nop
	nop
	nop
	nop

	multf	f24, f20, f29	; a4^3

	nop
	nop
	nop
	nop

	multf	f3, f27, f11	; a2 * m

	nop
	nop
	nop
	nop

	multf	f4, f28, f11	; a3 * m

	addf	f12, f12, f3	; m22
	sf	M + 20, f3
	nop
	nop

	multf	f5, f29, f11	; a4*m

	addf	f12, f12, f4	; m32
	sf	M + 36, f4
	nop
	nop

	multf	f17, f17, f11	; a1^2 * m

	addf	f12, f12, f5	; m42
	sf	M + 52, f5
	nop	
	nop

	multf	f18, f18, f11	; a2^2 * m

	addf	f12, f12, f17	; m13
	sf	M + 8, f17
	nop	
	nop

	multf	f19, f19, f11	; a3^2 * m

	addf	f12, f12, f18	; m23
	sf	M + 24, f18
	nop	
	nop

	multf	f20, f20, f11	; a4^2 * m

	addf	f12, f12, f19	; m33
	sf	M + 40, f19
	nop	
	nop

	multf	f21, f21, f11	; a1^3 * m 

	addf	f12, f12, f20	; m43
	sf	M + 56, f20
	nop	
	nop

	multf	f22, f22, f11	; a2^3 * m 

	addf	f12, f12, f21	; m14
	sf	M + 12, f21
	nop	
	nop

	multf	f23, f23, f11	; a3^3 * m 

	addf	f12, f12, f22	; m24
	sf	M + 28, f22
	nop	
	nop

	multf	f24, f24, f11	; a4^3 * m 

	addf	f12, f12, f23	; m34
	sf	M + 44, f23
	nop	
	nop

	addf	f12, f12, f24	; m44
	sf	M + 60, f24
	sf checkM, f12

final:
	trap	0

