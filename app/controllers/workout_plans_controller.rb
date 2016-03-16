class WorkoutPlansController < ApplicationController
  def index
    @workout_plans = WorkoutPlan.all
  end

  def show
    @workout_plan = WorkoutPlan.find(params[:id])
  end

  def new
    @workout_plan = WorkoutPlan.new
  end

  def create
    @workout_plan = WorkoutPlan.new(workout_plan_params)
    if @workout_plan.save
      flash[:success] = 'Your Workout Plan Was created'
      redirect_to workout_plans_path
    else
      render :new
    end
  end

  private

  def workout_plan_params
    params.require(:workout_plan).permit(:name, :description, :summary)
  end
end
