@TweebList = React.createClass
  componentDidMount: () ->
    $('#scroll-spy-beacon')
      .scrollSpy()
      .on 'scrollSpy:enter', () => @props.onBottomReached()

  renderTweebs: () ->
    @props.posts.map (post, index) ->
      <Tweeb
        key={post._id}
        user={post.user}
        moment={post.moment}
        message={post.message}
      />

  render: () ->
    <div>
      {@renderTweebs()}
      <div id="scroll-spy-beacon"></div>
    </div>
