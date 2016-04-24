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

  componentDidMount: function() {
    this.handleScrollPosition();
  },

  handleScrollPosition: function() {
    function sticky_relocate() {
        var window_top = $(window).scrollTop();
        var div_top = $('.sets-sticky-anchor').offset().top - 60;
        if (window_top > div_top) {
            $('.set-header').addClass('stick');
        } else {
            $('.set-header').removeClass('stick');
        }
    }
    $(window).scroll(sticky_relocate);
    sticky_relocate();
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
        <div className="sets-sticky-anchor"></div>
        <div className="set-header">
          <span className="set-workout-name">{this.state.workoutData.name}</span>
          <span className="set-workout-info">Day {this.state.workoutData.day}:</span>
          <span className="set-workout-info">{this.state.completedSetsArr.length} of {this.state.workoutLength} sets completed</span>
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
