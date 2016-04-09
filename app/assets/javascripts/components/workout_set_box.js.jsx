var WorkoutSetBox = React.createClass({
  getInitialState: function() {
    return {
      set: this.props.set,
      poppedUp: false,
      completed: false
    };
  },

  activatePopUp: function() {
    this.setState({poppedUp: true});
  },

  deavctivatePopUp: function(){
    this.setState({poppedUp: false});
  },

  handleComleteWorkout: function() {
    if (this.state.completed) {
    }
    else {
      this.setState({completed: true});
      this.props.completeSet(this.state.set.id);
    }
  },

  render: function() {
    var overlay = this.state.poppedUp ? "overlay-active" : "overlay-inactive";
    var checkMark = this.state.completed ? "set-complete set-completed" : "set-complete";
    var borderLeft = this.state.completed ? "set-box completed" : "set-box";
    return (
      <div>
        <div className={borderLeft}>
          <div className="set-box-left" onClick={this.activatePopUp}>
          <div className="set-amount">
            {this.state.set.amount}
          </div>
          <div className="set-name">
            {this.state.set.name}
          </div>
          </div>
          <div className={checkMark} onClick={this.handleComleteWorkout}>
            ✓
          </div>
        </div>
        <div id="popup1" className={overlay}>
          <div className="popup">
            <span className="popup-close" onClick={this.deavctivatePopUp}>&times;</span>
            <div className="popup-content">
              <span className="popup-amount">{this.state.set.amount}</span>
              <span className="popup-reps">{this.state.set.rep_type}</span>
              <span className="popup-name">{this.state.set.name}</span>
              <span className="popup-description">{this.state.set.description}</span>
            </div>
          </div>
        </div>
      </div>
      );
    }
});
