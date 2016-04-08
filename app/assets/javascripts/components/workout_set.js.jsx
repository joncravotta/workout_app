var WorkoutSet = React.createClass({
  getInitialState: function() {
    return {
      data: this.props.workout_set.workout_set
    };
  },

  render: function() {
    console.log(this.props.workout_set);
      return (
        <div>
          <h1>{this.state.data.name}</h1>
        </div>
      );
    }
});
