class WorkoutSetsController < ApplicationController
  before_filter :set_intializers, only: [:index]

  def index
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

  def edit
    @workout_set = WorkoutSet.find(params[:id])
  end

  def update
    if @workout_set.update(workout_set_params)
      flash[:success] = 'Your Workout was updated successfully'
      redirect_to workout_workout_sets_path(@workout_set.workout)
    else
      render :edit
    end
  end

  def complete
    CompletedSet.create(completed: params[:completed], user: current_user, workout_set: @workout_set)
    flash[:success] = "You have completed the #{@workout_set.name} set"
    redirect_to workout_workout_sets_path(@workout_set.workout)
  end

  private

  def workout_set_params
    params.require(:workout_set).permit(:name, :rep_type, :amount, :description)
  end

  def set_intializers
    @workout = Workout.find(params[:workout_id])
    @workout_set = WorkoutSet.where(workout_id: @workout)
  end

  def require_same_user
    workout = Workout.find(@workout_set.workout)
    if current_user != workout.user
      flash[:danger] = 'You can only edit your own workouts'
      redirect_to workout_path
    end
  end
end
