;   ___   ___ _ ___ _ ___
;  / _ \ / __/ ( _ ) / _ \
; | (_) | (__| / _ \ \_, /
;  \___/ \___|_\___/_|/_/
;;  |_ _/ __|_   _|
;;   | |\__ \ | |
;;  |___|___/ |_|
;;
;; Lab 3: Pipelining


;;   #define N 8
;;   double A[N-1]  =  {0,1,1,2,3,5,7,11,15};
;;   int64  x  =  1,  y  =  1,  z  =  0,  rec,  fact  =  1,  i  =  1;
;;   double *pA  =  &A[0];
;;
;;   do {
;;     fact  =  fact * i  - *pA;
;;     rec  = y + y + z;
;;     z  =  y;
;;     y  =  x;
;;     x  =  rec;
;;     i++;
;;     pA++;
;;   } while(i != N);


        .data
fact:   .word    0x0
rec:  .word    0x0
A:      .word    0, 1, 1, 2, 3
        .word    5, 7, 11, 15

        .code
        daddi    $1, $0, A      ; $1 = Index for A
        daddi    $2, $0, 2      ; $2 = 2 ;; x
        daddi    $3, $0, 0      ; $3 = 0 ;; y
        daddi    $4, $0, 3      ; $4 = 3 ;; z
        daddi    $5, $0, 1      ; $5 = 1 ;; i
        daddi    $6, $0, 8      ; $6 = N ;; N = 8
        daddi    $12, $0, 1     ; $12 = 1 ;; fact = 1

loop:   dmul     $12, $12, $5   ; $12 = fact *i
        lw       $16, 0($1)     ; $16 = A[i-1]

        dadd     $7, $4, $3     ; $7 = rec = z + y
        dadd     $7, $7, $3     ; $7 = rec = rec + y
        daddi    $4, $3, 0      ; $4 = z = y
        daddi    $3, $2, 0      ; $3 = y = x
        daddi    $2, $7, 0      ; $2 = x = rec

        dsub     $12, $12, $16  ; $12 = fact *i - A[i-1]

        daddi    $5, $5, 1      ; i++
        daddi    $1, $1, 8      ; pA++

        
        bne      $6, $5, loop   ; Exit loop if i == N

        sw       $12, fact($0)     ; Store factorial result
        sw       $7, rec($0)     ; Store recursive result
        halt


;; Expected result: fact  =  444(hex)/ 1092(dec)
;;                  rec =     33(hex)/ 51(dec)
