class ItemsController < ApplicationController

  def accept_item
    @item = Item.find(params[:id])
    @item.state = :accept
    @item.save
    redirect_to ngos_path
  end
end
