// create a tweet class
import scala.collection.mutable.ListBuffer
class Tweet(Id: Int, Author: String, Text: String, Time: String)
{
  var id = Id
  var author = Author
  var text = Text
  var time = Time
  
    def display()
    {   println("\n********************************\n")
  
      println("Tweet Id: " + Id)
        println("Author: " + Author)
        println("Text: " + Text)
        println("Time: " + Time)
        println("\n********************************\n")
    }

}


object Twitter {

  // check if tweet is present in the list
  def check(id: Int, list: ListBuffer[Tweet]): Int =
  {
    var found = -1
    // return the index of the tweet if found
    for (i <- 0 until list.length)
    {
      if (list(i).id == id)
        found = i
    }
    return found
  }

  def listTweets(tweets: ListBuffer[Tweet]): Unit = {
    if(tweets.isEmpty){
        println("********************************")
      println("No tweets available")
         println("********************************\n")

      return
    }
    println("********************************LIST OF TWEETS********************************")
    for (tweet <- tweets) {
      tweet.display()
    }
  }

  def deleteTweet(tweets: ListBuffer[Tweet], id: Int, f: (Int, ListBuffer[Tweet])=> Int): Unit = {
    if(tweets.isEmpty){
      println("******************************** TWEETS NOT FOUND********************************")
      return
    }
    // var found = false
    // for (i <- 0 until tweets.length) {
    //   if (tweets(i).id == id) {
    //     tweets.remove(i)
    //     found = true
        
    //   }
    // }
    if (f(id, tweets) == -1) {
      println("******************************** TWEET NOT FOUND********************************")
      return
    }
    tweets.remove(f(id, tweets))
    println("******************************** TWEET DELETED ********************************")
  }

  def addTweet(tweets: ListBuffer[Tweet]): Unit = {
    val id = scala.util.Random.nextInt(100)
    println("Enter the author: ")
    val author = scala.io.StdIn.readLine()
    println("Enter the text: ")
    val text = scala.io.StdIn.readLine()

    val time = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date())
    // create a tweet
    val tweet = new Tweet(id, author, text, time)
    // add tweet to the list
    tweets += tweet
    println("******************************** TWEET ADDED ********************************")
  }

  def updateTweet(tweets: ListBuffer[Tweet], id: Int): Unit = {
    if(tweets.isEmpty){
      println("******************************** TWEETS NOT FOUND********************************")
      return
    }
    var flag = false
    for (i <- 0 until tweets.length) {
      if (tweets(i).id == id) {
        val author = tweets(i).author
        println("Enter the text: ")
        val text = scala.io.StdIn.readLine()

        val time = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date())
        // create a tweet
        val tweet = new Tweet(id, author, text, time)
        // add tweet to the list
        tweets(i) = tweet
        flag = true
      }
      if (!flag) {
        println("******************************** TWEET NOT FOUND ********************************")
        return
      }
      

    }
    println("******************************** TWEET UPDATED ********************************")
  }

  def main(args: Array[String]): Unit = {


    // create a list of tweets
    val tweets = new ListBuffer[Tweet]
    
    // ask input from user and create a tweet

   println("********************************\n")
  println("WELCOME TO TWITTER")
  println("********************************\n")

    while(true){
    println("Enter 1 to add a tweet")
    println("Enter 2 to delete a tweet")
    println("Enter 3 to update a tweet")
    println("Enter 4 to list all tweets")
    println("Enter 5 to exit")
    println("Enter your choice: ")
    val choice = scala.io.StdIn.readInt()

    if (choice == 1) {
      addTweet(tweets)
    }
    else if (choice == 2) {
      println("Enter the id of the tweet to delete: ")
      val id = scala.io.StdIn.readInt()
      deleteTweet(tweets, id, check)
    }
    else if (choice == 3) {
      println("Enter the id of the tweet to update: ")
      val id = scala.io.StdIn.readInt()
      updateTweet(tweets, id)
    }
    else if (choice == 4) {
      listTweets(tweets)
    }
    else if (choice == 5) {
      println("******************************** THANK YOU *************************\n")
      System.exit(0)
    }
    else {
      
      println("******************************** INVALID CHOICE ********************************")
    }
  }

    
    // display the tweet
  }
}