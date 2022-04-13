data = []
main = do
    handle <- openFile "data.txt" ReadMode
    contents <- hGetContents handle
    let singlewords = words contents
        list = f singlewords
        data = executeList 0 list
    print data
    hClose handle   

f :: [String] -> [Integer]
f = map read