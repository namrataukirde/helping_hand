class UsersController < ApplicationController
  def profile
  end

  def list_donations
    send("#{current_user.detail_type.downcase}_donations")
  end

  def volunteer_donations
    @items = current_user.items.page(params[:page]).per(params[:per])
  end

  def ngo_donations
    @q = Item.list_donations_for_ngo(current_user.detail).ransack(params[:q])
    @items = @q.result.page(params[:page]).per(params[:per])
  end

  private

  def item_params
    params[:item].permit(:description, :quantity, :category)
  end
end
