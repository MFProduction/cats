class FuneralsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_funeral, only: [:show, :destroy]

  def index
    @funerals = Funeral.all.order(:start_time)
  end

  def day
    @date = Date.parse(params[:date])
    @weather = Weather.get_forecast(@date)
    @funerals = Funeral.where(start_time: @date.midnight..@date.end_of_day)
    @schedule = {}
    #(0..23).step(2).each do |hour| # 24 hour
    (8..16).step(2).each do |hour|
      funeral = @funerals.where('extract(hour from start_time) = ?', hour).first
      date = "#{DateTime.new(@date.year, @date.month, @date.day, Time.parse("#{hour}:00").hour)}"
      @schedule.merge!(date => funeral)
    end
  end

  def new
    @date = DateTime.parse(params[:date])
    @funeral = Funeral.new
  end

  def create
    @funeral = Funeral.new(funeral_params)
    @funeral.customer_id = current_customer.id
    if @funeral.save
      flash[:success]= 'Funeral was successfully created.'
      redirect_to day_path(@funeral.start_time)
    else
      flash[:danger]= @funeral.errors
      redirect_to :back
    end
  end

  def destroy
    if @funeral.customer_id == current_customer.id
      @funeral.destroy
      flash[:success]= 'Funeral was canceled.'
      redirect_to day_path(@funeral.start_time)
    else
      flash[:danger]= 'This was not your cat :)'
      redirect_to day_path(@funeral.start_time)
    end
  end

  private
    def set_funeral
      @funeral = Funeral.find(params[:id])
    end

    def funeral_params
      params.require(:funeral).permit(:cat_name, :start_time)
    end
end
