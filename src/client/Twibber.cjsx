@Twibber = React.createClass
  getInitialState: () ->
    posts: []
    skip: 0
    limit: 0
    query: {}

  updatePosts: (skip = @state.skip, limit = @state.limit) ->
    @setState
      skip: skip
      limit: limit
      posts: twibber.posts
        .find(@state.query, { sort: { moment: -1 }, skip: skip, limit: limit })
        .fetch()

  componentDidMount: () ->
    Meteor.setInterval (() => @updatePosts()), 1000

    $('#scroll-spy-beacon')
      .scrollSpy()
      .on 'scrollSpy:enter', () =>
        if twibber.posts.find(@state.query).count() > @state.limit
          @updatePosts(@state.skip, @state.limit + 10)

  render: () ->
    <div>
      <header>
        <div className="center-text">
          <h1>Feed</h1>
          <p className="text-muted">recent tweebs</p>
        </div>
      </header>
      <p className="text-muted">{@state.limit}</p>
      <TweebInputForm/>
      <hr/>
      <TweebList posts={@state.posts}/>
      <div id="scroll-spy-beacon"></div>
    </div>