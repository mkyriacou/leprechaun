class ItemsController < ApplicationController

  def index
    # add some security ;)
    #all_list = List.where("user_id = ?", current_user.id)

    @this_list = List.find(params[:list_id])
    @items = @this_list.items.all #what if there is nothing?
    # # respond_to do |format|
    # #   format.json {render json: @items}
    # end

  end


end
