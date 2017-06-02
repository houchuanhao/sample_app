json.extract! comm, :id, :content, :user_id, :micropost_id, :created_at, :updated_at
json.url comm_url(comm, format: :json)
