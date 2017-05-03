class ExpiryDatesController < ApplicationController
  before_action :set_expiry_date, only: [:show, :edit, :update, :destroy, :product_decrese_count, :product_change_count]

  # GET /expiry_dates
  # GET /expiry_dates.json
  def index
    @expiry_dates = ExpiryDate.all
  end

  # GET /expiry_dates/1
  # GET /expiry_dates/1.json
  def show
  end

  # GET /expiry_dates/new
  def new
    @expiry_date = ExpiryDate.new
  end

  # GET /expiry_dates/1/edit
  def edit
  end

  # POST /expiry_dates
  # POST /expiry_dates.json
  def create
    @expiry_date = ExpiryDate.new(expiry_date_params)

    respond_to do |format|
      if @expiry_date.save
        ExpiryDate.last.create_callendar(ExpiryDate.last.id)
        flash.now[:notice] = "Expiry date was successfully created."
        @expiry_dates = ExpiryDate.all
        format.js {render :index}
        format.html { redirect_to @expiry_date, notice: 'Expiry date was successfully created.' }
        format.json { render :show, status: :created, location: @expiry_date }
      else
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @expiry_date.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /expiry_dates/1
  # PATCH/PUT /expiry_dates/1.json
  def update
    respond_to do |format|
      if @expiry_date.update(expiry_date_params)
        id = ExpiryDate.find(params[:id]).id
        ExpiryDate.last.change_calendar(id, params[:product_id])
        flash.now[:notice] = "Expiry date was successfully updated."
        @expiry_dates = ExpiryDate.all
        format.js {render :index}
        format.html { redirect_to @expiry_date, notice: 'Expiry date was successfully updated.' }
        format.json { render :show, status: :ok, location: @expiry_date }
      else
        format.js { render :edit}
        format.html { render :edit }
        format.json { render json: @expiry_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def product_decrese_count
    @product = Admin::Product.find(@expiry_date.product_id)
  end

  def product_change_count
    count = @expiry_date.count.to_i
    count = count - params[:count].to_i
    if count == 0 then
      destroy
    else
      @expiry_date.count = count
      @expiry_date.save
    end
    respond_to do |format|
      flash.now[:notice] = "Count was successfully destroyed."
      @expiry_dates = ExpiryDate.all
      format.js {}
      format.html {}
      format.json { head :no_content }
    end
  end

  # DELETE /expiry_dates/1
  # DELETE /expiry_dates/1.json
  def destroy
    @expiry_date.destroy
    respond_to do |format|
      flash.now[:notice] = "Expiry date was successfully destroyed."
      @expiry_dates = ExpiryDate.all
      format.js {render :index}
      format.html { redirect_to expiry_dates_url, notice: 'Expiry date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expiry_date
      @expiry_date = ExpiryDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expiry_date_params
      params.require(:expiry_date).permit(:product_id, :part_number, :count, :date_added, :date_expiry, :time_expiry)
    end
end
