class BooksController < ApplicationController

	before_action :authenticate_user!

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id)
		else
			@books = current_user.books.all
			@profile_image = current_user
			render action: :index
		end
	end

	def index
		@book = Book.new
		@books = current_user.books.all
		@profile_image = current_user
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path
	end

	def books_page
		@book = Book.new
		@books = Book.all
		@profile_image = current_user
	end

	private

		def book_params
			params.require(:book).permit(:user_id, :title, :opinion)
		end

end
