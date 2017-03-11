module Autoregressive where
import Data.List
--dotProduct function 
--inp: input, coefs: coefficient, ys: output stream
--When the length of output is larger or equal than 9, then the list 
--will be emptied, and restart the calculation from y0.

dotProduct ys ( inp, coefs)  |length ys <9 =(z,zs)                       
						     |otherwise =dotProduct [] ( inp, coefs)
							 where
						     ws = zipWith (*) coefs (take 5 ys)
						     z = foldl (+) inp ws
						     zs = z:ys
							 
--sim recursively calls dotProduct												
						
sim dotProduct ys (x,[]) =[]
sim dotProduct ys ([],xs) =[]
sim dotProduct ys (inp:inps, coefs) 
                  = result:sim dotProduct zs (inps,coefs)
				  where
				  (outp,zs) = dotProduct ys (inp,coefs)
				  result = outp

                        						
								  