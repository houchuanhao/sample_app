json.extract! commit, :id, :content, :micropost_id, :created_at, :updated_at
json.url commit_url(commit, format: :json)
