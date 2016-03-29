class WorkoutPlansController < ApplicationController
  before_action :require_user, except: [:show, :index]

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
    @workout_plan.user = current_user

    if @workout_plan.save
      flash[:success] = 'Your Workout Plan Was created'
      redirect_to workout_plans_path
    else
      render :new
    end
  end

  def follow
    @workout_plan = WorkoutPlan.find(params[:id])
    if Follow.where(user: current_user, workout_plan: @workout_plan).present?
      flash[:danger] = "You are already following this plan"
      redirect_to :back  # send suser back to where they were came from
    else
      Follow.create(follow: params[:follow], user: current_user, workout_plan: @workout_plan)
      flash[:success] = "You are now following this plan"
      redirect_to :back  # send suser back to where they were came from
    end
  end
# if Business.where(:user_id => current_user.id).present?
# if Business.exists?(user_id: current_user.id)
  def delete_follow
    @follow = Follow.find(params[:id])
    follow = @follow.delete
    if follow
      flash[:success] = "You have unfollowed this plan"
      redirect_to :back  # send suser back to where they were came from
    else
      flash[:danger] = "Your update could not be completed"
      redirect_to :back  # send suser back to where they were came from
    end
  end

  private

  def workout_plan_params
    params.require(:workout_plan).permit(:name, :description, :summary)
  end
end
