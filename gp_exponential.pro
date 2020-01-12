PRO gp_exponential, X, A, F, pder 
  bx = EXP(A[1] * X) 
  F = A[0] * bx + A[2]*A[2] 
 
;If the procedure is called with four parameters, calculate the 
;partial derivatives. 
  IF N_PARAMS() GE 4 THEN $ 
    pder = [[bx], [A[0] * X * bx], [replicate(1.0, N_ELEMENTS(X))]] 
END
