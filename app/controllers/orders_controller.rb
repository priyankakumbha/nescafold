class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if @current_user.present?
      # if @current_user.admin
      #   @orders = Order.all
      # else
      @orders = @current_user.orders
    else
      redirect_to login_path
    end
  end

  def adminmain
    if @current_user.present?
      @orders = Order.all if @current_user.admin
    else
      redirect_to adminLogin_path
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    if @current_user.present?
      time = Time.now
      order_name = @current_user.name + time.to_s

      @shop = Shop.find(params["orderList"]["0"]["shop_id"].to_i)
      @order = Order.create name: order_name, user_id: @current_user.id
      i = 0
      if @order.present?
        until params["orderList"].length - 1 < i
          @lineitem = LineItem.create product_id: params["orderList"][i.to_s]["product_id"].to_i, order_id: @order.id.to_i, quantity: params["orderList"][i.to_s]["product_quantity"].to_i, price: params["orderList"][i.to_s]["product_price"].to_i
          i += 1
        end
        # UserMailer.order_summary(@user).deliver_now
        redirect_to orders_path
        # t.integer  "product_id"
        # t.integer  "order_id"
        # t.integer  "quantity"
        # t.integer  "price"
      end
    else
      redirect_to login_path
    end
    # @order = Order.new ( )
    # @order = Order.new(order_params)
    #
    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def updatestatus

    @order = Order.find_by_id(params["request"]["name"])
    @order.update( :status => params["state_search"])

    redirect_to adminmain_path
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :status)
  end
end
