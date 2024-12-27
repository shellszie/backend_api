class LikedBookController < ApplicationController
  def create
    @user_id = current_user.id
    @liked_book_obj = LikedBook.create!(
      user_id: @user_id,
      isbn: params[:isbn]
    )
    if @liked_book_obj.save
      render :json => @liked_book_obj,
             :status => :created
    else
      render :status => :unprocessable_entity
    end
  end

  # def index
  #   @user_id = current_user.id
  #   @saved_books = SavedBook.where(user_id: @user_id)
  #   if (@saved_books.count > 0)
  #     render :json => @saved_books,
  #            :status => :ok
  #   else
  #     render :status => :no_content
  #   end
  # end
  #
  # def destroy
  #   @user_id = current_user.id
  #   @saved_book = SavedBook.find_by(user_id: @user_id, isbn: params[:isbn])
  #   @saved_book.destroy
  #   render :status => :ok
  # end

  def liked_book_params
    params.require(:liked_book).permit(:isbn)
  end

end
