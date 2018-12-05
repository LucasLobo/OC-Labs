;; Organization of Computers (OC)
;; Lab: Pipelining
;; Ricardo.Chaves@tecnico.ulisboa.pt
;; IST, Lisbon-Portugal, 01-10-2015
;; revisto 12 Jul 2016, jcm@inesc-id.pt

;; The following program computes the compensated factorial of N-1
;; and the Lucas number for n = N+1. The outcome values are stored
;; in variables fact and lucas, respectively.
;; 
;;   #define N 9
;;   double A[N-1] = {0, 1, 3, 0, 7, 0, 1, 5};
;;   int64 x=2, y=1, lucas, fact=1, i=1;
;;   double *pA = &A[0];                      
;;           
;;   do {                 
;;     lucas=x+y; x=y; y=lucas;           
;;     fact = fact * i + *pA;            
;;     i++;     
;;     pA++;
;;   } while(i!=N);
  	
  	 
        .data
fact:   .word    0x0
lucas:  .word    0x0
A:      .word    0, 1, 3, 0, 7
        .word    0, 1, 5

        .code
        daddi    $1, $0, A      ; $1 = Index for A
        daddi    $2, $0, 2      ; $2 = 2 ;; x
        daddi    $3, $0, 1      ; $3 = 1 ;; y
        daddi    $5, $0, 1      ; $5 = 1 ;; i	
        daddi    $6, $0, 9      ; $6 = N ;; N = 9
        daddi    $12, $0, 1     ; $12 = 1 ;; fact = 1

loop:   dmul     $12, $12, $5   ; $12 = fact *i
        dadd     $4, $2, $3     ; $4 = lucas = x + y
        daddi    $2, $3, 0      ; $2 = x = y
        daddi    $3, $4, 0      ; $3 = y = lucas

        lw       $16, 0($1)     ; $16 = A[i-1]
        daddi    $5, $5, 1      ; i++
        dadd     $12, $12, $16  ; $12 = fact *i + A[i-1]
        daddi    $1, $1, 8      ; pA++
        
        dmul     $12, $12, $5   ; $12 = fact *i
        dadd     $4, $2, $3     ; $4 = lucas = x + y
        daddi    $2, $3, 0      ; $2 = x = y
        daddi    $3, $4, 0      ; $3 = y = lucas

        lw       $16, 0($1)     ; $16 = A[i-1]
        daddi    $5, $5, 1      ; i++
        daddi    $1, $1, 8      ; pA++
        dadd     $12, $12, $16  ; $12 = fact *i + A[i-1]
        
        bne      $6, $5, loop   ; Exit loop if i == N
	
        sw       $12, fact($0)     ; Store factorial result
        sw       $4, lucas($0)     ; Store lucas result
        halt

;; Expected result: fact  =  1443d(hex)/ 83005(dec)
;;                  lucas =     4c(hex)/    76(dec)
