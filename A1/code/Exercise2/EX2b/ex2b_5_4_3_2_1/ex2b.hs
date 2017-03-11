---by Nan Yang
---Please read explainations in report
module Polynomial where
import CLaSH.Prelude

polynomial :: (Default a, SaturatingNum a)
    => Signal a ->Signal a->Signal a->Signal a->Signal a-> Signal a -> Signal a

polynomial  a4 a3 a2 a1 a0 x= a4*x^4+a3*x^3+a2*x^2+a1*x+a0 

topEntity :: Signal (Signed 16) -> Signal (Signed 16)
topEntity = (polynomial 5 4 3 2 1)