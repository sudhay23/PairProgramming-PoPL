-- Variables in Haskell are IMMUTABLE --> Hence we demonstrate only with runtime variables
allTweets = [["1", "Sudhay", "Hello"],["2", "Sudhay", "Twitter is Amazing!!"], ["3", "Sandeep", "Byee"]]

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

-- Delete tweet if author is "GivenAuthor"
deleteAuthorTweets :: String -> [[String]] -> [[String]]
deleteAuthorTweets givenAuthor [] = []
deleteAuthorTweets givenAuthor (x:xs)
  | checkAuthor givenAuthor (x!!1) = (deleteAuthorTweets givenAuthor xs)
  | otherwise = x : (deleteAuthorTweets givenAuthor xs)


-- Higher Order function to check if the author is a name passed
checkAuthor :: String -> String -> Bool
checkAuthor tweetAuthor author = if tweetAuthor==author then True else False

-- Main Function
main = do
    putStrLn "\n1. List All Tweets\n2. Create a Tweet\n3. Delete a Tweet\n4. Update a Tweet\n5. Delete an Author's Tweets\n6. Exit"
    putStr "Enter a number: "
    inputStr <- getLine
    let option = read inputStr::Int
    if option == 1
        then do
            putStr "\t\tAll Tweets List: "
            print readTweets
            main
            else if option==2
                then do
                    putStr "\tEnter Tweet ID: "
                    tweetId <- getLine
                    putStr "\tEnter Author Name: "
                    authorName <- getLine
                    putStr "\tEnter Tweet: "
                    tweet <- getLine
                    let newTweet = [tweetId, authorName, tweet]
                    let result = createTweet newTweet
                    putStr "\t\tTweet Created: "
                    print (result)
                    main
                    else if option==3
                        then do
                            putStr "\tEnter Tweet ID: "
                            tweetId <- getLine
                            let result = deleteTweet tweetId allTweets
                            putStr "\t\tAfter deletion: "
                            print (result)
                            main
                            else if option==4
                                then do
                                    putStr "\tEnter Tweet ID: "
                                    tweetId <- getLine
                                    putStr "\tEnter Author Name: "
                                    authorName <- getLine
                                    putStr "\tEnter Tweet: "
                                    tweet <- getLine
                                    let newTweet = [tweetId, authorName, tweet]
                                    let result = updateTweet tweetId newTweet allTweets
                                    putStr "\t\tUpdated List: "
                                    print (result)
                                    main
                                else if option==5
                                    then do
                                        putStr "\tEnter Author Name: "
                                        authorName <- getLine
                                        let result = deleteAuthorTweets authorName allTweets
                                        putStr "\t\tAfter deletion of author wise Tweets: "
                                        print (result)
                                        main
                                    else if option==6
                                        then do
                                            putStrLn "Exiting..."
                                        else do
                                            putStrLn "Invalid input. Please try again."
                                            main