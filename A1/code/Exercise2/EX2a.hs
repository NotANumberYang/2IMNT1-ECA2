--By Nan Yang
--Please check report for explainations
module Polynomial where

----Definition 
polynomial :: Float->Float->Float->Float->Float->Float->Float
polynomial x a4 a3 a2 a1 a0= a4*x^4+a3*x^3+a2*x^2+a1*x+a0 
f0 x = polynomial x 5 4 3 2 1
f1 x = polynomial x 16 8 4 2 1
f2 x = polynomial x 31 15 7 3 1

