class UsersController < ApplicationController
  def profile
  end

  def add_donation
  end

  def list_donations
    send("#{current_user.detail_type.downcase}_donations")
  end

  def volunteer_donations
    @items = current_user.items
  end

  def ngo_donations
    @items = Item.page(params[:page]).per(params[:per])
  end
end
