@TweebList = React.createClass
  renderTweebs: () ->
    @props.posts.map (post, index) ->
      <Tweeb
        key={post.moment}
        user={post.user}
        moment={post.moment}
        message={post.message}
      />

  render: () ->
    <div>
      {@renderTweebs()}
    </div>