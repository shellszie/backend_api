class ThumbsDownBookController < ApplicationController

  def create
    @user_id = current_user.id
    @thumbs_down_book_obj = ThumbsDownBook.create!(
      user_id: @user_id,
      isbn: params[:isbn],
      title: params[:title],
      author: params[:author]
    )
    if @thumbs_down_book_obj.save
      render :json => @thumbs_down_book_obj,
             :status => :created
    else
      render :status => :unprocessable_entity
    end
  end

  def index
    @user_id = current_user.id
    @thumbs_down_books = ThumbsDownBook.where(user_id: @user_id)
    if (@thumbs_down_books.count > 0)
      render :json => @thumbs_down_books,
             :status => :ok
    else
      render :status => :no_content
    end
  end

  def thumbs_down_book_params
    params.require(:thumbs_down_book).permit(:isbn, :title, :author)
  end
end
