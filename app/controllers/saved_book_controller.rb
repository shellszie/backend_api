class SavedBookController < ApplicationController
  def create
    @user_id = current_user.id
    debugger
    Rails.logger.debug "+++++++++++++++ params= #{params}"
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

  def saved_book_params
    params.require(:saved_book).permit(:title, :author, :isbn, :img_url)
  end

end
