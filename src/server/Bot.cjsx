class Bot
  constructor: () ->
    @timerId = null

  start: () ->
    @timerId = Meteor.setInterval(@flood, 5000)

  stop: () ->
    Meteor.clearInterval(@timerId)

  flood: () ->
    twibber.feed.push(twibber.textGenerator.genText(10))

twibber.bot = new Bot
