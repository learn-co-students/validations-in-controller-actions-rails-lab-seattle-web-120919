class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  # re-render form if the new author is invalid.
  def create
    @author = Author.new(author_params)
    
    if @author.valid?
       @author.save
       redirect_to author_path(@author)
    else 
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end