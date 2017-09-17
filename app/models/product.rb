class Product < ApplicationRecord

  def find_all_by(parameter_order)
      Product.all.order parameter_order
  end
end
