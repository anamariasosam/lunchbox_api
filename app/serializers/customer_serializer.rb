class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :phone_number
end
