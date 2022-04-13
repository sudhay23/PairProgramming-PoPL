-- import qualified Data.Map.Strict as M
-- let d = M.fromList [("a", 10.33), ("c", 20.23), ("d", 100.33)]
-- M.lookup "c" d

-- Hashmap 
import qualified Data.Map.Strict as H
main :: IO()
main = do
    H.fromList [("a", 10.33), ("c", 20.23), ("d", 100.33)]
    
    -- H.lookup "c" h
    -- print "HEllo"
