class SearchController < ApplicationController
  def create
    @user_id = current_user.id
    @search_term = params["searchTerm"]
    # book = Book.create(title: "The Lord of the Rings", author: "J.R.R. Tolkien")
    @search_obj = Search.create!(user_id: @user_id, search_term: @search_term)
    if @search_obj.save
        render :json => @search_obj,
        :status => :created
    else
      render :status => :unprocessable_entity
    end
  end

  def search_params
    params.require(:search).permit(:search_term)
  end

end
