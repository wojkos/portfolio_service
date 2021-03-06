# Controler for display
class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[show edit update destroy]
  layout 'portfolio'
  access all: %i[show index], user: { except: %i[destroy new create update edit sort] }, site_admin: :all, message: 'You shall not pass'

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |_key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Item was successfully destroyed.' }
    end
  end

  private

  def set_portfolio_item
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end

  def portfolio_item_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :thumb_image,
                                      :main_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end
end
