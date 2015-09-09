class Feed
  constructor: () ->

  push: (message, user = 'bot') ->
    twibber.posts.insert
      message: message
      moment: Date.now()
      user: user

twibber.feed = new Feed