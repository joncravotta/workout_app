class WorkoutPlansController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @workout_plans = WorkoutPlan.all.reverse
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
      redirect_to dashboard_workout_plan_path(@workout_plan)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @workout_plan.update(workout_plan_params)
      flash[:success] = 'Your Workout Plan was updated successfully'
      redirect_to workout_plan_workouts_path(@workout_plan)
    else
      render :edit
    end
  end

  def destroy
    WorkoutPlan.find(params[:id]).destroy
    Follow.where(workout_plan: params[:id]).destroy_all
    flash[:success] = "Successfully deleted"
    redirect_to home_created_path
  end

  def follow
    @workout_plan = WorkoutPlan.find(params[:id])
    if Follow.where(user: current_user, workout_plan: @workout_plan).present?
      flash[:danger] = "You are already following the #{@workout_plan.name} plan."
      redirect_to :back  # send suser back to where they were came from
    else
      Follow.create(follow: params[:follow], user: current_user, workout_plan: @workout_plan)
      flash[:success] = "You are now following the #{@workout_plan.name} plan."
      redirect_to workout_plan_workouts_path(@workout_plan) 
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

  def dashboard
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout = Workout.where(workout_plan: @workout_plan)
  end

  private

  def workout_plan_params
    params.require(:workout_plan).permit(:name, :description, :summary, :picture)
  end

  def require_same_user
    @workout_plan = WorkoutPlan.find(params[:id])
    if current_user != @workout_plan.user
      flash[:danger] = 'You can only edit your own workout plans'
      redirect_to workout_plans_path
    end
  end
end
