class ListsController < ApplicationController

  def index
  	lists = List.where("user_id = ?", current_user.id)
    @lists = lists.sort_by { |k| k[:created_at] }.reverse
    # @lists = List.all
    respond_to do |format|
      format.json {render json: @lists}
    end
  end


  # def new
  #   @list = List.new
    # respond_to do |format|
    #   format.json {render json: @list}
    # end
  # end

  def create
  	#receives params from a form-for
    # @list = List.create(params[:list])
    List.create(params[:list])

    lists = List.where("user_id = ?", current_user.id)
    @lists = lists.sort_by { |k| k[:created_at] }.reverse
    # @lists = List.all
    respond_to do |format|
      format.json {render json: @lists}
    end
  end

end
