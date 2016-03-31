class HomeController < ApplicationController
  def index
  end

  def profile
    @following = Follow.where(user: current_user.id).reverse
  end

  def created
    @workout_plans = WorkoutPlan.where(user: current_user).reverse
  end
end
