class UsersController < ApplicationController
  def profiles
  end

  def list_donations
    send("#{current_user.detail_type.downcase}_donations")
    @items = @items.page(params[:page]).per(params[:per])
  end

  def processed_donations
    send("#{current_user.detail_type.downcase.pluralize}_processed_donations")
    @items = @items.page(params[:page]).per(params[:per])
  end

  def volunteer_donations
    @items = current_user.items.order(updated_at: :desc)
  end

  def ngo_donations
    @q = Item.list_donations_for_ngo(current_user.detail.id).ransack(params[:q])
    @items = @q.result
  end

  def volunteers_processed_donations
    @items = current_user.items.where(state: params[:state])
      .order(updated_at: :desc)
  end

  def ngos_processed_donations
    @q = Item.list_donations_for_ngo(current_user.detail.id)
      .where(state: params[:state]).ransack(params[:q])
    @items = @q.result
  end

  private

  def item_params
    params[:item].permit(:description, :quantity, :category)
  end
end
