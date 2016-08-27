class DonationsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update]

  def accept_donation
    Item.where(id: params[:id]).first.accept!
    redirect_to list_donations_users_path
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    @item.update_attributes(item_params)
    redirect_to list_donations_users_path
  end

  private

  def authorize_user
    @item = Item.where(id: params[:id]).first
    redirect_to(list_donations_users_path) unless(@item.donor == current_user.detail)
  end

  def item_params
    params[:item].permit(:description, :quantity, :category)
  end
end
