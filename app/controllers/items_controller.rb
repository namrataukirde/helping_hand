class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @item.donor == current_user.detail or raise ActionController::RoutingError.new('Not Found')
  end
end
