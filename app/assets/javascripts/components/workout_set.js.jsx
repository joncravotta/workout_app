var WorkoutSet = React.createClass({
  getInitialState: function() {
    return {
      current_user: this.props.current_user,
      setData: this.props.workout_set,
      workoutData: this.props.workout,
      workoutLength: this.props.workout_set.length,
      workout_days: this.props.workout_plan_days.length,
      completedSetsArr: []
    };
  },

  handleSetCompletion: function(id) {
    new_arr = this.state.completedSetsArr;
    new_arr.push(id);
    this.setState({completedSetsArr: new_arr});
  },

  handleDisplayComplete: function() {
    $('.set-button').fadeIn( "slow" );
  },

  render: function() {
    if (this.state.completedSetsArr.length == this.state.workoutLength){
      this.handleDisplayComplete();
    }
    var handleSetCompletion = this.handleSetCompletion;
    return (
      <div className="container">
        <div className="set-header">
          <div>
            <span className="set-workout-info">Day {this.state.workoutData.day}: </span><span className="set-workout-name">{this.state.workoutData.name}</span>
          </div>
          <span className="set-workout-count">{this.state.completedSetsArr.length} of {this.state.workoutLength} sets completed</span>
        </div>
        <div className="set-box-container">
        {this.state.setData.map(function(set) {
          return (<WorkoutSetBox key={set.id} set={set} completeSet={handleSetCompletion}/>);
          })}
        </div>
      </div>
     );
    }
});
