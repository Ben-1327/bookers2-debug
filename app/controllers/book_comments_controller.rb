class BookCommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    if comment.save
      redirect_to book_path(@book)
    else
      @user = @book.user
      @comment = BookComment.new
      render template: 'books/show'
    end
  end

  

  def destroy
    @comment = BookComment.find(params[:book_id])
    @book = @comment.book_id
  	@comment.destroy
  	redirect_to book_path(@book), notice: "successfully delete comment!"
  end


  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
