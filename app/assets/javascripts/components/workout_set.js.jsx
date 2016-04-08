var WorkoutSet = React.createClass({
    getInitialState: function() {
        return {
            data: this.props.workout_set,
            workout_length: this.props.workout_set.length
        };

    },

    render: function() {
        console.log(this.state.data);
        return (
            <ul>
                {this.state.workout_length}
            {
                this.state.data.map(function(set) {
                    return <li key={set.name}>{set.name}</li>;
                })
            }
            </ul>
        );
    }
});
