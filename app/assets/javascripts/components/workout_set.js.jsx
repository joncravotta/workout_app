var WorkoutSet = React.createClass({
  getInitialState: function() {
    return {
      setData: this.props.workout_set,
      workoutData: this.props.workout,
      workoutLength: this.props.workout_set.length,
      workout_days: this.props.workout_plan_days.length};
  },
render: function() {
  console.log(this.state.setData);
  console.log(this.state.workoutData);
  console.log(this.props);
  return (
    <div className="container">
      <div className="set-header">
        <span className="set-workout-name">{this.state.workoutData.name}</span>
        <span className="set-workout-info">Day {this.state.workoutData.day}: {this.state.workoutLength} Sets</span>
      </div>
      <div className="set-box-container">
      {this.state.setData.map(function(set) {
        return (<WorkoutSetBox key={set.name} set={set}/>);
        })}
      </div>
      <div className="set-button-container">
        <div className="set-button">
          Complete
        </div>
      </div>
    </div>
   );
  }
});
