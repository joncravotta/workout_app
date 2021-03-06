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
      redirect_to dashboard_workout_path(workout)
    else
      render :new
    end
  end

  def duplicate
    @workout_set = WorkoutSet.find(params[:id]).dup
    if @workout_set.save
      flash[:success] = 'Set was duplicated'
      redirect_to dashboard_workout_path(params[:workout_id])
    else
      flash[:danger] = 'Set could not be duplicated'
      redirect_to dashboard_workout_path(params[:workout_id])
    end
  end

  def edit
    @workout_set = WorkoutSet.find(params[:id])
  end

  def update
    @workout_set = WorkoutSet.find(params[:id])
    if @workout_set.update(workout_set_params)
      flash[:success] = 'Your Workout was updated successfully'
      redirect_to dashboard_workout_path(@workout_set.workout)
    else
      render :edit
    end
  end

  def destroy
    @workout_set = WorkoutSet.find(params[:id])
    WorkoutSet.find(@workout_set).destroy
    flash[:success] = 'Successfully deleted'
    redirect_to dashboard_workout_path(@workout_set.workout)
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
    @workout_plan = WorkoutPlan.find(@workout.workout_plan)
    @workout_plan_days = Workout.where(workout_plan_id: @workout_plan)
  end

  def require_same_user
    workout = Workout.find(@workout_set.workout)
    if current_user != workout.user
      flash[:danger] = 'You can only edit your own workouts'
      redirect_to workout_path
    end
  end
end
