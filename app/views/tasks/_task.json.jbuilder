json.extract! task, :id, :name, :status, :start_date, :end_date, :content, :priority, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
