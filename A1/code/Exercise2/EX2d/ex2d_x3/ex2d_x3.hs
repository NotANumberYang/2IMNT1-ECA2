--By Nan Yang
--Please check report for explainations
module Polynomial where
import CLaSH.Prelude

polynomial :: (Default a, SaturatingNum a)
    => (Signal a ,Signal a,Signal a,Signal a,Signal a) -> Signal a -> Signal a

polynomial (a4,a3,a2,a1,a0) x = foldl (+) 0  ((a4*x+a3)*x^3:>a2*x^2:>a1*x:>a0:>Nil)

topEntity :: (Signal (Signed 16),Signal (Signed 16),Signal (Signed 16),Signal (Signed 16),Signal (Signed 16))
              ->Signal (Signed 16) -> Signal (Signed 16)
topEntity = polynomial 