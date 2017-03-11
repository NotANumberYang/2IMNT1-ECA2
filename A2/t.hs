module CPU_Haskell where

---basic operation 
rd us i = us!!i

{- ************************************************************ -
 - function value							-
 - ************************************************************ -}
data Value = Const Int | Addr Int   	deriving Show
value heap val = case val of				
				Const n -> n
				Addr m  -> rd heap m
				
{- ************************************************************ -
 - alu and core						-
 - ************************************************************ -}
data Op = Add | Mul deriving Show
data Instr = Push Value| Calc Op | Send  deriving Show		
				
--add Send instr to program0, Send after calculation
prog = [ Push (Const 2),
		Push (Addr 0), 
		Calc Mul,
		Send,
		Push (Const 3), 
		Push (Const 4), 
		Push (Addr 1),
		Calc Add, 
		Send,
		Calc Mul,
		Send,		 
		Calc Add, 
		Send,
		Push (Const 12),
		Push (Const 5), 
		Calc Add, 
		Send,
		Calc Mul, 
		Send]
--alu		 		 			 
alu op x y  = case op of
				Add -> x+y
				Mul -> x*y
				
core prog (stack,heap,cntr) clk = ((stack',heap, cntr'),z)
								where 
									cntr' = cntr + 1
									(stack',z) = case rd prog cntr  of
										Push val -> (n : stack,(-1))
											where 
												n  =  value heap val
										Send -> (stack,z')
											where 
												[z'] =  take 1 stack									
										Calc op -> (v : stackTemp,(-1))
											where 
												[x, y]  =  take 2 stack
												stackTemp  =  drop 2 stack
												v  =  alu op x y
												
--define the heap for test												
h = [10,11] ++ replicate 6 0	
--test func											
test_CPU_0 = -- putStr $ unlines $ map show $
	     take 10 $ sim (core prog) ([],h,0) clock
		 
		 
		 
		 
		 
															
{- ************************************************************ -
 - Simulation							-
 - ************************************************************ -}

data Tick = Tick		deriving Show
clock = Tick : clock


sim f s []        = []
sim f s (x:xs)    = (s',o) : sim f s' xs
                  where
                    (s',o) = f s x											
								   
								 
								 							 
								
								 
		
