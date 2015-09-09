@Tweeb = React.createClass
  render: () ->
    postedAt = moment(@props.moment);
    humanizedDiff = moment.duration( moment().diff(postedAt) ).humanize();
    <div className="panel panel-primary">
      <div className="panel-heading">
        posted {humanizedDiff} ago by <b>{@props.user}</b>
      </div>
      <div className="panel-body">
        {@props.message}
      </div>
    </div>