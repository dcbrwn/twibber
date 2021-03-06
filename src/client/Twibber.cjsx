@Twibber = React.createClass
  getInitialState: () ->
    posts: []
    query: {}
    projection:
      skip: 0
      limit: 10
      sort: { moment: -1 }

  componentDidMount: () ->
    debouncedUpdater = _.debounce(_.bind(@updatePosts, @), 1000)
    twibber.posts.find().observe
      added: (document) -> debouncedUpdater()

  updatePosts: () ->
    @setState
      posts: twibber.posts.find(@state.query, @state.projection)

  handleFilterChanges: (sort = { moment: -1 }, query = {}) ->
    @state.projection.sort = sort;
    @state.projection.query = query;
    @updatePosts()

  handleTweebSubmit: (message, user) ->
    twibber.feed.push(message, user)

  handleLazyLoading: () ->
    if twibber.posts.find(@state.query).count() > @state.projection.limit
      @state.projection.limit += 10
      # @state.projection.skip += 10 if @state.projection.limit > 30
      @updatePosts()

  render: () ->
    <div>
      <TwibberBotController/>
      <TweebInputForm onTweebSubmit={@handleTweebSubmit}/>
      <hr/>
      <div className="center-text page-header">
        <h3>
          Feed<br/>
          <small>recent tweebs</small>
        </h3>
      </div>
      <TweebFilter
        projection={@state.projection}
        query={@state.query}
        onFilterChanged={@handleFilterChanges}
      />
      <TweebList
        posts={@state.posts}
        onBottomReached={@handleLazyLoading}
      />
    </div>
