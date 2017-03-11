---basic operation 
rd us i  =  us!!i	

----define a function value
data Value = Const Int | Addr Int  	deriving Show

value heap V =  case V of
				Const n -> z1
				Addr m  -> z2
					where z1 = n
						  z2 = rd heap m
				  
						  
-----define alu and core
data Op = Add | Mul deriving Show
data Instr = Push Value| Calc Op | Send  deriving Show

---add Send instr to program0, Send after calculation
program0 = [ Push (Const 2),
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
		 		 			 
h = [10,11] ++ replicate 6 0

decode instr = case instr of
					Push Val -> Push (value h Val)
					Calc op	->  Calc op 	
					Send ->Send

prog = map decode program0
		
alu op x y = case op of
                Add ->x+y
				Mul ->x*y

core prog (stack,cntr) clk =((stack', cntr'),z)
							   where
								 instr = rd prog cntr
								 cntr' = cntr+1								 
								 (stack',z) = case instr of
												Push n -> (n : stack,-1)
												Calc op -> (v : stackTemp,-1)
												Send -> (stack,z')
														where
															[x, y] = take 2 stack
															stackTemp = drop 2 stack
															v = alu op x y
															z'= take 1 stack
														
				

{- ************************************************************ -
 - Simulation							-
 - ************************************************************ -}

data Tick = Tick		deriving Show
clock = Tick : clock


sim f s []        = []
sim f s (x:xs)    = (s',o) : sim f s' xs
                  where
                    (s',o) = f s x