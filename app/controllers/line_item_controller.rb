class LineItemController < ApplicationController

  def lineItemList
     @order = Order.find_by_name (params["name"])
     @line_items = @order.line_items

     @mapped_line_items = @line_items.map do |li|
       new_line_item = JSON.parse( li.to_json )
       new_line_item[:product] = li.product
       new_line_item
     end

     respond_to do |format|
      format.html
      format.json {
        obj = {
          :lineItems => @mapped_line_items,
          :order => @order
        }
        render :json => obj
      }
    end
  end
end
