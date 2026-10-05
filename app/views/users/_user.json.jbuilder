json.extract! user, :id, :first_name, :department_id, :created_at, :updated_at
json.url user_url(user, format: :json)
