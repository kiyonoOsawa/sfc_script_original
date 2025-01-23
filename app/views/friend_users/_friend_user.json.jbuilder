json.extract! friend_user, :id, :user_id, :friend_id, :created_at, :updated_at
json.url friend_user_url(friend_user, format: :json)
