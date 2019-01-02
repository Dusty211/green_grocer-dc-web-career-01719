require 'pry'
=begin
cart = [
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"KALE"    => {:price => 3.0, :clearance => false}}
]

coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.0}]
=end
cart = {
  "PEANUTBUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
  "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
  "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
}

def consolidate_cart(cart)
  consolidated_cart = {}
  in_cart = []
  cart.each do |item|
    if in_cart.include?(item.keys.join)
      consolidated_cart[item.keys.join][:count] += 1
    else
      in_cart << item.keys.join
      consolidated_cart[item.keys.join] = item[item.keys.join]
      consolidated_cart[item.keys.join][:count] = 1
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  return_cart = {}
  return_cart.merge!(cart)
  coupons.each do |coupon|
    cart.each do |key, value|
      if (coupon[:item] == key) && (coupon[:num] <= value[:count])
        if return_cart.keys.include?("#{coupon[:item]} W/COUPON")
          return_cart["#{coupon[:item]} W/COUPON"][:count] = return_cart["#{coupon[:item]} W/COUPON"][:count] + 1
        else 
          return_cart.merge!({"#{key} W/COUPON" => {:price => coupon[:cost], :clearance => value[:clearance], :count => 1}})
        end
        return_cart[key][:count] = return_cart[key][:count] - coupon[:num]
      end
    end
  end
  return_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
