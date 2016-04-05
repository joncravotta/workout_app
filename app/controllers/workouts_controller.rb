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
