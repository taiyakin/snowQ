json.extract! question, :id, :title, :text, :video, :image, :user_id, :category_id, :created_at, :updated_at
json.url question_url(question, format: :json)
