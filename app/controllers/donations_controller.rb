class DonationsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update]

  def accept_donation
    Item.where(id: params[:id]).first.accept!
    redirect_to list_donations_users_path
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    if current_user.volunteer? && @item.donor != current_user.detail
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def create
    @item = Item.new(item_params.merge(donor_id: current_user.detail.id))
    if @item.save
      flash[:notice] = 'Added new item successfully'
      redirect_to list_donations_users_path
    else
      flash[:error] = @item.errors.full_messages.join('<br>')
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item updated successfully'
      redirect_to list_donations_users_path
    else
      flash[:error] = @items.errors.full_messages.join('<br>')
      render :edit
    end
  end

  private

  def authorize_user
    @item = Item.where(id: params[:id]).first
    redirect_to(list_donations_users_path) unless(@item.donor == current_user.detail)
  end

  def item_params
    params[:item].permit(:name, :description, :quantity, :category, :image)
  end
end
