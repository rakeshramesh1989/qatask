require 'test_helper'

class OrderTest < ActiveSupport::TestCase

   test "the truth" do
     assert true
   end

   test "check empty array is returned when user does not exists " do

     response=Order.user_order_stats(434343)
     puts response

   end



   test "check array is retuned for user with one order and multiple items" do

     puts users(:two).email
     puts users(:two).id
     puts shop_items(:one)
     shop_itemsarray=Array([shop_items(:one).id,shop_items(:two).id])
     puts "Array value is #{shop_itemsarray}"
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"

   end

end
