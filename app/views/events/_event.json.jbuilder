json.extract! event, :id, :name, :description, :urlName, :startDate, :endDate, :imageUrl, :mainColor, :color2, :locationCode, :created_at, :updated_at
json.url event_url(event, format: :json)
