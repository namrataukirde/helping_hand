class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def landing_page
    @ngo_user = User.new(detail: Ngo.new)
    @volunteer = User.new(detail: Volunteer.new)
  end
end
