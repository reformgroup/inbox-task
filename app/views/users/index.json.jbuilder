json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :email, :gender, :birth_date, :password_digest, :remember_digest, :role, :avatar
  json.url user_url(user, format: :json)
end
