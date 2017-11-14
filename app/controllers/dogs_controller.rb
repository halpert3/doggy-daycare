class DogsController < ApplicationController

  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    #if it saves go to index
    if @dog.save
      redirect_to dogs_url, notice: 'Success!'
    else
      flash.now[:notice] = "Something went wrong."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_url(@dog), notice: "#{@dog.name} successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  def destroy
    if @dog.destroy
      redirect_to dogs_url, notice: "Successfully deleted."
    else
      redirect_to dogs_url, notice: "Could not delete dog."
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed)
  end

  def set_dog
   @dog = Dog.find(params[:id])
 end



end


