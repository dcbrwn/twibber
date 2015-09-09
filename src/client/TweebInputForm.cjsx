@TweebInputForm = React.createClass
  send: (e) ->
    e.preventDefault()
    user = React.findDOMNode(this.refs.user).value.trim();
    message = React.findDOMNode(this.refs.message).value.trim();
    @props.onTweebSubmit(message, user) if user && message

  render: () ->
    <form onSubmit={@send}>
      <div className="form-group">
        <label>User:</label>
        <input className="form-control" type="text" ref="user" />
      </div>
      <div className="form-group">
        <label>Message:</label>
        <textarea className="form-control" ref="message" rows="4" />
      </div>
      <input className="btn btn-primary" type="submit" value="Tweeb!" />
    </form>
