class EmailBookController < ApplicationController
  def create
    @user_id = current_user.id
    @email_book_obj = EmailBook.create!(
      user_id: @user_id,
      title: params[:title],
      author: params[:author],
      isbn: params[:isbn],
      img_url: params[:img_url],
      preview_url: params[:preview_url]
    )
    if @email_book_obj.save
      render :json => @email_book_obj,
             :status => :created
    else
      render :status => :unprocessable_entity
    end
  end

  def index
    @user_id = current_user.id
    @email_books = EmailBook.where(user_id: @user_id)
    if (@email_books.count > 0)
      render :json => @email_books,
             :status => :ok
    else
      render :status => :no_content
    end
  end


  def email_book_params
    params.require(:email_book).permit(:title, :author, :isbn, :img_url, :preview_url)
  end

end
