var WorkoutSet = React.createClass({
    getInitialState: function() {
        return {
            setData: this.props.workout_set,
            workoutData : this.props.workout,
            workoutLength: this.props.workout_set.length,
            workout_days: this.props.workout_plan_days.length
        };

    },

    render: function() {
        console.log(this.state.setData);
        console.log(this.state.workoutData);
        console.log(this.props);
        return (
            <ul>
                <div>{this.state.workoutLength} Sets</div>
                <div>Day {this.state.workoutData.day} of {this.state.workout_days}</div>
            {
                this.state.setData.map(function(set) {
                    return (<li key={set.name}>{set.name}</li>);
                })
            }
            </ul>
        );
    }
});
