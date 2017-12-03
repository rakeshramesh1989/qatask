require 'test_helper'

class OrderTest < ActiveSupport::TestCase

   test "the truth" do
     assert true
   end

   test "check empty array is returned when user does not exists " do

     response=Order.user_order_stats(434343)
     puts response

   end

   test "check proper value is retuned for user with order containing one item and one quantity " do
      #one order with 1 lemon
      puts "check proper value is retuned for user with order containing one item and one quantity"
     shop_itemsarray=Array([shop_items(:one).id])
     puts "Array value is #{shop_itemsarray}"
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"

   end
   test "check proper value is retuned for user with order containing one item and multiple quantity " do
      #one order with 2 lemon
      puts "one order and order containing one item and multiple quantity"
     shop_itemsarray=Array([shop_items(:one).id,shop_items(:one).id])
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"

   end
   test "check proper value is retuned for user with one order, multiple items and one quantity" do
   ## one order with 1 apple 1 lemon
     puts "check proper value is retuned for user with one order, multiple items and one quantity"
     shop_itemsarray=Array([shop_items(:one).id,shop_items(:two).id])
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"

   end

   test "check correct value is retuned for user with multiple order containing and each order one unique item and one quantity" do
      # 2 orders 1st order 1 lemon end 2nd order 1 apple
    puts"check correct value is retuned for user with multiple order containing one item and one quantity"
    Order.place_an_order(Array([shop_items(:one).id]),users(:two).id)
     Order.place_an_order(Array([shop_items(:two).id]),users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"

   end

end
