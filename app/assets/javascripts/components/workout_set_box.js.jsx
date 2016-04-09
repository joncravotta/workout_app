var WorkoutSetBox = React.createClass({
  getInitialState: function() {
    return {
      set: this.props.set
    };
  },
render: function() {
  return (
    <div className="set-box">
      <div className="set-box-left">
      <div className="set-amount">
        {this.state.set.amount}
      </div>
      <div className="set-name">
        {this.state.set.name}
      </div>
      </div>
      <div className="set-complete">
        ✓
      </div>
    </div>
    );
  }
});
