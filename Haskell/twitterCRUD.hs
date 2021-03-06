-- Variables in Haskell are IMMUTABLE --> Hence we demonstrate only with runtime variables
allTweets = [["1", "Sudhay", "Hello"], ["2", "Sandeep", "Byee"]]

-- Format: [["id","author","tweet"]]

-- Read all tweets
readTweets :: [[String]]
readTweets = allTweets

-- Create a New Tweet into the list of all tweets
createTweet :: [String] -> [[String]]
createTweet tweetArr = allTweets ++ [tweetArr]

-- Delete a Tweet from the list of all tweets based on ID
deleteTweet :: String -> [[String]] -> [[String]]
deleteTweet tweetId [] = []
deleteTweet tweetId (x : xs)
  | x !! 0 == tweetId = xs
  | otherwise = x : (deleteTweet tweetId xs)

-- Update a Tweet on the list of all tweets based on ID
updateTweet :: String -> [String] -> [[String]] -> [[String]]
updateTweet tweetId tweetArr [] = []
updateTweet tweetId tweetArr (x : xs)
  | x !! 0 == tweetId = tweetArr : xs
  | otherwise = x : (updateTweet tweetId tweetArr xs)


-- Delete tweet if author is "Sudhay"
deleteSudhayTweets :: [[String]] -> [[String]]
deleteSudhayTweets [] = []
deleteSudhayTweets (x:xs)
  | checkAuthor "Sudhay" (x!!1) = xs
  | otherwise = x : (deleteSudhayTweets xs)


-- Higher Order function to check if the author is a name passed
checkAuthor :: String -> String -> Bool
checkAuthor tweetAuthor author = if tweetAuthor==author then True else False