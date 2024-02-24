json.extract! shop, :id, :name, :address, :phone_number, :url, :opening_hours, :chain, :created_at, :updated_at
json.url shop_url(shop, format: :json)
