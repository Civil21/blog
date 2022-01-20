class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user
    @articles = @profile.articles
  end

end
