@Twibber = React.createClass
  getInitialState: () ->
    posts: []
    skip: 0
    limit: 0
    query: {}
    sort: { moment: -1 }

  componentDidMount: () ->
    Meteor.setInterval (() => @updatePosts()), 1000

    $('#scroll-spy-beacon')
      .scrollSpy()
      .on 'scrollSpy:enter', () =>
        if twibber.posts.find(@state.query).count() > @state.limit
          @state.limit += 10
          @updatePosts()

  updatePosts: () ->
    posts = twibber.posts
      .find(@state.query, { sort: @state.sort, skip: @state.skip, limit: @state.limit })

    @setState
      posts: posts

  handleFilterChanges: (sort = { moment: -1 }, query = {}) ->
    @state.sort = sort;
    @state.query = query;
    @updatePosts()

  handleTweebSubmit: (message, user) ->
    twibber.feed.push(message, user)

  render: () ->
    <div>
      <TwibberBotController/>
      <header>
        <div className="center-text">
          <h1>Feed</h1>
          <p className="text-muted">recent tweebs</p>
        </div>
      </header>
      <TweebInputForm onTweebSubmit={@handleTweebSubmit}/>
      <hr/>
      <TweebFilter
        currentSort={@state.sort}
        currentFilter={@state.query}
        onFilterChanged={@handleFilterChanges}
      />
      <TweebList posts={@state.posts}/>
      <div id="scroll-spy-beacon"></div>
    </div>
