class FuneralsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_funeral, only: [:show, :destroy]

  def index
    @funerals = Funeral.all
  end

  def day
    @date = Date.parse(params[:date])
    @weather = Weather.get_forecast(@date)
    @funerals = Funeral.where(start_time: @date.midnight..@date.end_of_day).order("start_time ASC")
    @schedule = {}
    (8...18).step(2).each do |hour|
      funeral = @funerals.where('extract(hour from start_time) = ?', hour).first
      if funeral
        @schedule.merge!("#{hour}" => funeral)
      else
        @schedule.merge!("#{hour}" => nil)
      end
    end
  end


  def new
    d = Date.parse(params[:date])
    t = Time.parse("#{params[:hour]}:00")
    @date = DateTime.new(d.year, d.month, d.day, t.hour)
    @funeral = Funeral.new
  end

  def create
    @funeral = Funeral.new(funeral_params)
    @funeral.customer_id = current_customer.id
    if @funeral.save
      redirect_to funerals_url, notice: 'Funeral was successfully created.'
    else
      render :new
      #redirect_to action: day, params["date"]:funeral_params[:start_time].to_date
    end
  end

  def destroy
    @funeral.destroy
    redirect_to funerals_url, notice: 'Funeral was successfully destroyed.'
  end

  private
    def set_funeral
      @funeral = Funeral.find(params[:id])
    end

    def funeral_params
      params.require(:funeral).permit(:cat_name, :start_time)
    end
end
