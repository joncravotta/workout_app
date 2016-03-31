class HomeController < ApplicationController
  def index
  end

  def profile
    @following = Follow.where(user: current_user.id).reverse
  end
end
