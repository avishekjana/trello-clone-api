json.extract! task, :id, :title, :description, :board_id, :state, :due_date, :member_id, :created_at, :updated_at
json.url task_url(task, format: :json)
