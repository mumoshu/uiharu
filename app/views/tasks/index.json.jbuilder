json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :assignee_id, :assignor_id, :start_date, :due_date, :finish_date
  json.url task_url(task, format: :json)
end
