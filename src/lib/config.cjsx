# Declare namespace
@twibber = {}

twibber.posts = new Mongo.Collection('posts')

if Meteor.isServer
  Meteor.publish 'posts', () ->
    twibber.posts.find()

if Meteor.isClient
  Meteor.subscribe 'posts'
