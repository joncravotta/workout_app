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

  render: function() {
    console.log(this.state.setData);
    console.log(this.state.workoutData);
    console.log(this.props);
    console.log(this.state.workoutLength);
    console.log(this.state.completedSetsArr.length );
    var setButton;
    if (this.state.completedSetsArr.length == this.state.workoutLength){
      setButton = "set-button set-button-completed";
    }
    else {
      setButton = "set-button";
    }
    var handleSetCompletion = this.handleSetCompletion;
    return (
      <div className="container">
        <div className="set-header">
          <span className="set-workout-name">{this.state.workoutData.name}</span>
          <span className="set-workout-info">Day {this.state.workoutData.day}: {this.state.workoutLength} Sets</span>
        </div>
        <div className="set-box-container">
        {this.state.setData.map(function(set) {
          return (<WorkoutSetBox key={set.id} set={set} completeSet={handleSetCompletion}/>);
          })}
        </div>
        <div className="set-button-container">
          <a href={"/workout_plans/" + this.state.workoutData.id + "/workouts"}>
            <div className={setButton}>
              Complete
            </div>
          </a>
        </div>
      </div>
     );
    }
});
