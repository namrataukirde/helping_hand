class UsersController < ApplicationController
  def add_donation
    current_user.items.create(item_params)
    redirect_to list_donations_users_path
  end

  def profile
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

  private

  def item_params
    params[:item].permit(:description, :quantity, :category)
  end
end
