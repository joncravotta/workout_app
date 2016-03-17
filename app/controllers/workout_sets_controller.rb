class WorkoutSetsController < ApplicationController
  def index
    @workout_set = WorkoutSet.where(workout_id: params[:workout_id])
    @workout = Workout.find(params[:workout_id])
  end

  def show
    @workout = WorkoutSet.find(params[:id])
  end

  def new
    workout = Workout.find(params[:workout_id])
    @workout_set = workout.workout_sets.build
  end

  def create
    workout = Workout.find(params[:workout_id])
    @workout_set = workout.workout_sets.create(workout_set_params)
    if @workout_set.save
      flash[:success] = 'Your Workout set Was created'
      redirect_to workout_workout_sets_path
    else
      render :new
    end
  end

  private

  def workout_set_params
    params.require(:workout_set).permit(:name, :rep_type, :amount, :description)
  end
end
