class Bot
  constructor: () ->
    @timerId = null

  start: () ->
    @timerId = Meteor.setInterval(@flood, 5000)
    console.log('Bot started')

  stop: () ->
    Meteor.clearInterval(@timerId)
    @timerId = null
    console.log('Bot stopped')

  isFlooding: () ->
    !! @timerId

  flood: () ->
    twibber.feed.push(twibber.textGenerator.genText(10))

twibber.bot = new Bot
