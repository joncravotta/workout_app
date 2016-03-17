class WorkoutsController < ApplicationController
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

  private

  def workout_params
    params.require(:workout).permit(:name, :day, :description)
  end
end
