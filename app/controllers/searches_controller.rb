class SearchesController < ApplicationController

  def search
    @user_or_book = params[:option]
    @how_search = params[:choice]
    @book = Book.new
    if @user_or_book == "1"
      @users = search_contents(params[:search], @user_or_book, @how_search)
      render template: 'users/index'
    else
      @books = search_contents(params[:search], @user_or_book, @how_search)
      render template: 'books/index'
    end
  end

  def search_contents(search, user_or_book, how_search)
    if user_or_book == "1"
      if how_search == "1"
        User.where(['name LIKE ?', "#{search}"])
      elsif how_search == "2"
        User.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "3"
        User.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "4"
        User.where(['name LIKE ?', "%#{search}%"])
      end
    else
      if how_search == "1"
        Book.where(['title LIKE ?', "#{search}"])
      elsif how_search == "2"
        Book.where(['title LIKE ?', "#{search}%"])
      elsif how_search == "3"
        Book.where(['title LIKE ?', "%#{search}"])
      elsif how_search == "4"
        Book.where(['title LIKE ?', "%#{search}%"])
      end
    end

  end

end
