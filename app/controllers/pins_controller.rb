class PinsController < ApplicationController
  before_action :find_pin, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new, edit, update, destroy]

  def index
    @pins = Pin.all.order('created_at DESC')
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Successfully created new Pin.'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path, notice: 'Pin successfully deleted.'
  end

  private

  def pin_params
    params.require(:pin).permit(%i[title description image])
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
