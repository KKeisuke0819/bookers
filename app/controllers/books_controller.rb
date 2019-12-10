class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(book_params)
			flash[:update] = "Book was successfully update."
			redirect_to @book
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def create
		@books = Book.all
		@book = Book.new(book_params)

		if @book.save
		  flash[:notice] = "Book was successfully created."
		  redirect_to @book
		else
		  render :index, status: :unprocessable_entity
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
        flash[:destroy] = "Book was successfully destroyed."
		redirect_to books_path
	end

	def show
		@book = Book.find(params[:id])
	end

	private
	  def book_params
	  	params.require(:book).permit(:title, :body)
	  end

end
