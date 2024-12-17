class SavedBookController < ApplicationController
  def create
    @user_id = current_user.id
    @saved_book_obj = SavedBook.create!(
      user_id: @user_id,
      title: params[:title],
      author: params[:author],
      isbn: params[:isbn],
      img_url: params[:img_url]
    )
    if @saved_book_obj.save
      render :json => @saved_book_obj,
             :status => :created
    else
      render :status => :unprocessable_entity
    end
  end

  def index
    @user_id = current_user.id
    @saved_books = SavedBook.where(user_id: @user_id)
    if (@saved_books.count > 0)
      render :json => @saved_books,
             :status => :ok
    else
      render :status => :no_content
    end
  end

  def destroy
    @user_id = current_user.id
    @saved_book = SavedBook.find_by(user_id: @user_id, isbn: params[:isbn])
    @saved_book.destroy
    render :status => :ok
  end

  def saved_book_params
    params.require(:saved_book).permit(:title, :author, :isbn, :img_url)
  end

end
