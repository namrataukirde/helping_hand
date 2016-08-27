class NgosController < ApplicationController

  def index
    @items = Item.where(state: :waiting)
  end
end
