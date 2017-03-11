--By Nan Yang
--Please check report for explainations
module Polynomial where
import CLaSH.Prelude

polynomial :: (Default a, SaturatingNum a)
    => (Signal a ,Signal a,Signal a,Signal a,Signal a) -> Signal a -> Signal a

polynomial (a4,a3,a2,a1,a0) x = foldl (+) 0  ws
                                where ws = zipWith (*) (a4:>a3:>a2:>a1:>a0:>Nil) (x^4:>x^3:>x^2:>x:>1:>Nil)

topEntity :: (Signal (Signed 16),Signal (Signed 16),Signal (Signed 16),Signal (Signed 16),Signal (Signed 16))
              ->Signal (Signed 16) -> Signal (Signed 16)
topEntity = polynomial 