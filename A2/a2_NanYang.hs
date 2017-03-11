{- ************************************************************ -
 - Assignment 2
 - Student: Nan Yang  0963123(TU/e)
 - Please load this file in GHCI and call function test_CPU_0 to test it
 -
 - ************************************************************ -}

module CPU_Haskell where

---basic operation 
rd us i = us!!i

{- ************************************************************ -
 - function value							-
 - ************************************************************ -}
data Value = Const Int | Addr Int | Top [Int] | Pop [Int]	deriving Show

--define a function to yield the numeric element
value heap val = case val of				
				Const n -> n
				Addr m  -> rd heap m

--define a function to Operate on stack
stackOpc(Top s) = take 1 s
stackOpc(Pop s) = drop 1 s				
				
{- ************************************************************ -
 - alu and core						-
 - ************************************************************ -}
data Op = Add | Mul  deriving Show
data Instr = Push Value| Calc Op | Send Int  deriving Show		
	
	
--add Send instr to program0
prog = [ Push (Const 2),
		Push (Addr 0), 
		Calc Mul,
		Send 5,
		Push (Const 3), 
		Push (Const 4), 
		Push (Addr 1),
		Calc Add, 
		Send 6,
		Calc Mul,
		Send 4,		 
		Calc Add, 
		Send 9,
		Push (Const 12),
		Push (Const 5), 
		Calc Add, 
		Send 4,
		Calc Mul, 
		Send 5]
--alu---------------------------------------		 		 			 
alu op x y  = case op of
				Add -> x+y
				Mul -> x*y
--core---------------------------------------------------   
--ct: a register to record cycles for Calc instruction
--r: a register for the read value from stack
--sp: stack pointer
--cntr: instruction counter			
core prog (stack,heap,cntr,r,ct,sp) clk = ((stack',heap, cntr',r',ct',sp'),z)
								where 								
									(stack',z,r',cntr',ct',sp') = case rd prog cntr  of  
										Push val -> (n : stack,(-1),0,cntr+1,0,sp+1)
											where 
												n  =  value heap val 
										Send n-> (stack,n,0, cntr+1,0,sp)
																			
										Calc op -> (s,(-1),r',cntr+ct,ct',sptemp)
											where 
												(s,sptemp) |ct==0 =(stackTemp,sptemp') --the first cycle :pop one value from stack
												  |otherwise = (v : stackTemp,sptemp'+1)-- the second cycle: pop the other value from stack, and do calculation
												[r'] = stackOpc(Top stack)	--store the top value to register r 											
												(stackTemp,sptemp')  = (stackOpc(Pop stack),sp-1) --pop the stack value, decrement stack pointer
												v  =  alu op r r' --calculation
												ct' |ct==0 = ct+1   --count cycles
													|otherwise =0   --clear ct register when two cycles are consumed for this instruction
												
--define the heap for test											
h = [10,11] ++ replicate 2 0	
--test func------------------------------------------------											
test_CPU_0 = take 25 $ sim (core prog) ([],h,0,0,0,(-1)) clock
		 
	 															
{- ************************************************************ -
 - Simulation							-
 - ************************************************************ -}

data Tick = Tick		deriving Show
clock = Tick : clock


sim f s []        = []
sim f s (x:xs)    = (s',o) : sim f s' xs
                  where
                    (s',o) = f s x											
								   
								 
								 							 
								
								 
		
