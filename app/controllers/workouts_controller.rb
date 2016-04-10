class WorkoutsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @workout = Workout.where(workout_plan_id: params[:workout_plan_id])
    @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
  end

  def show
    @workout = Workout.find(params[:workout_id])
  end

  def new
    workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    @workout = workout_plan.workouts.build
  end

  def create
    workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    @workout = workout_plan.workouts.create(workout_params)
    if @workout.save
      flash[:success] = 'Your Workout Was created'
      redirect_to workout_plan_workouts_path
    else
      render :new
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      flash[:success] = 'Your Workout was updated successfully'
      redirect_to workout_plan_workouts_path(@workout.workout_plan)
    else
      render :edit
    end
  end

  def complete
    @workout = Workout.find(params[:id])
    if CompletedWorkout.where(user: current_user, workout: @workout).present?
      flash[:danger] = "You have already completed this workout"
      redirect_to :back # send suser back to where they were came from
    else
      CompletedWorkout.create(completed: params[:completed], user: current_user, workout: @workout)
      flash[:success] = "You have completed your wokrout."
      redirect_to workout_plan_workouts_path(@workout)# send suser back to where they were came from
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :day, :description)
  end

  def require_same_user
    @workout = Workout.find(params[:id])
    workout_plan = WorkoutPlan.find(@workout.workout_plan)
    if current_user != workout_plan.user
      flash[:danger] = 'You can only edit your own workouts'
      redirect_to workout_path
    end
  end
end
