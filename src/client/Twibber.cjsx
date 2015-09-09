@Twibber = React.createClass
  getInitialState: () ->
    posts: []
    skip: 0
    limit: 10
    query: {}
    sort: { moment: -1 }

  componentDidMount: () ->
    debouncedUpdater = _.debounce(_.bind(@updatePosts, @), 1000)
    twibber.posts.find().observe
      added: (document) -> debouncedUpdater()

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

  handleLazyLoading: () ->
    if twibber.posts.find(@state.query).count() > @state.limit
      @state.limit += 10
      @updatePosts()

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
      <TweebList
        posts={@state.posts}
        onBottomReached={@handleLazyLoading}
      />
    </div>
