@TweebFilter = React.createClass
  sortByTime: () ->
    @props.onFilterChanged
      moment: (@props.projection.sort.moment || 1) * -1

  sortByUser: () ->
    @props.onFilterChanged
      user: (@props.projection.sort.user || 1) * -1

  render: () ->
    <div>
      Sort by:
      <div className="btn btn-group">
        <button className="btn btn-default" onClick={@sortByTime}>time</button>
        <button className="btn btn-default" onClick={@sortByUser}>user</button>
      </div>
    </div>
