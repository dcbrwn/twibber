@TweebInputForm = React.createClass
  send: (e) ->
    e.preventDefault()
    userInput = React.findDOMNode(this.refs.user)
    messageInput = React.findDOMNode(this.refs.message)

    user = userInput.value.trim();
    message = messageInput.value.trim();

    if user && message
      @props.onTweebSubmit(message, user)
      userInput.value = ''
      messageInput.value = ''

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
