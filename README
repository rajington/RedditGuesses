A bunch of new threads are popping up on [/r/gaming/new](http://www.reddit.com/r/gaming/new) where the OP is giving away free stuff if commenters guess a number. This app hosted on heroku http://redditguesses.herokuapp.com/ is a start of something to help with that, it simply checks the reddit API for all the top-level comments on a specific post and then uses a regex to find the numbers guessed.

Right now it doesn't even work completely, because there are API limitations to how many comments you can get at a time. I didn't have time to implement the logic to find additional comments after the first couple hundred, and I'm not sure of a way to do it without hitting reddit's servers pretty hard.

One could also easily add Heroku's scheduler to resave all the documents, which will trigger refreshing all the comment data.

Adding new posts is disabled to prevent abuse, but the owner of the app can easily add new posts by running console commands.

For example on Heroku: 
`heroku run console 'Post.create(:url => "http://www.reddit.com/r/gaming/comments/w61f4/keeps_seeing_these_giveawaysahh_why_the_hell_not/")'`

I just did this for fun and to learn some stuff with heroku and json, I don't plan on updating it anymore