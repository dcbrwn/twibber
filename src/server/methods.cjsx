Meteor.methods
  startBot: () ->
    twibber.bot.start()

  stopBot: () ->
    twibber.bot.stop()

  botStatus: () ->
    twibber.bot.isFlooding()