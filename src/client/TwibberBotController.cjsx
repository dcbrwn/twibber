@TwibberBotController = React.createClass
  getInitialState: () ->
    status: null

  updateBotStatus: () ->
    Meteor.call 'botStatus', (error, result) =>
      if !error
        @setState
          status: result

  start: () ->
    Meteor.call 'startBot'
    @updateBotStatus()

  stop: () ->
    Meteor.call 'stopBot'
    @updateBotStatus()

  componentDidMount: () ->
    Meteor.setInterval (() => @updateBotStatus()), 1000

  renderButtons: () ->
    if @state.status
      <button className="btn btn-success btn-xs" onClick={@stop}>disable</button>
    else
      <button className="btn btn-danger btn-xs" onClick={@start}>enable</button>

  render: () ->
    <div className="bot-controls well">
      Flood bot control: {@renderButtons()}
    </div>
