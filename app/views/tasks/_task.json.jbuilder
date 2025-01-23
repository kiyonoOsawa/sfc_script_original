json.extract! task, :id, :taskName, :tryDay, :deadDay, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
