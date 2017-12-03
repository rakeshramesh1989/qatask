require 'test_helper'

class OrderTest < ActiveSupport::TestCase

   

   test "check empty array is returned when order does not exsit for user " do

     puts "check empty array is returned when order does not exsit for user "
     response=Order.user_order_stats(users(:one).id)
     puts "array response is #{response} #{response.kind_of?(Array)}"
     assert_equal([],response)

  end
  test "check empty array is returned when user does not exsits " do

    puts "check empty array is returned when user does not exsits"
    response=Order.user_order_stats(4343433)
    puts "array response is #{response} #{response.kind_of?(Array)}"

 end

   test "check proper value is retuned for user with one order containing one item and one quantity " do
      #one order with 1 lemon [[item1],1,2]
      puts "check proper value is retuned for user with one order containing one item and one quantity"
     shop_itemsarray=Array([shop_items(:one).id])
     puts "Array value is #{shop_itemsarray}"
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"
     assert_equal(Array([shop_items(:one).name]),response[0])
     assert_equal(1,response[1])
     assert_equal(2,response[2])

   end
   test "check proper value is retuned for user with one order containing one item and multiple quantity " do
      #one order with 2 lemon[[item1],1,4]
      puts "check proper value is retuned for user with one order containing one item and multiple quantity"
     shop_itemsarray=Array([shop_items(:one).id,shop_items(:one).id])
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"
     assert_equal(Array([shop_items(:one).name]),response[0])
     assert_equal(1,response[1])
     assert_equal(4,response[2])

   end
   test "check proper value is retuned for user with one order, multiple items and one quantity" do
   ## one order with 1 apple 1 lemon [[item1,item2],2,4]
     puts "check proper value is retuned for user with one order, multiple items and one quantity"
     shop_itemsarray=Array([shop_items(:one).id,shop_items(:two).id])
     order=Order.place_an_order(shop_itemsarray,users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"
     assert_equal(Array([shop_items(:one).name,shop_items(:two).name]),response[0])
     assert_equal(2,response[1])
     assert_equal(4,response[2])

   end

   test "check correct value is retuned for user with multiple order containing and each order different item and one quantity" do
      # 2 orders -  1st order 1 lemon end, 2nd order 1 apple  [[item1,item2],2,4]
    puts"check correct value is retuned for user with multiple order containing one item and one quantity"
    Order.place_an_order(Array([shop_items(:one).id]),users(:two).id)
     Order.place_an_order(Array([shop_items(:two).id]),users(:two).id)
     response=Order.user_order_stats(users(:two).id)
     puts "array response is #{response}"
     assert_equal(Array([shop_items(:one).name,shop_items(:two).name]),response[0])
     assert_equal(2,response[1])
     assert_equal(4,response[2])

   end

end
