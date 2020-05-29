json.array! @questions do |question|
  json.id question.id
  json.title question.title
  json.text question.text
  json.video question.video
  json.image question.image
  json.user_id question.user_id
  json.category_id question.category_id
  json.user_sign_in current_user
end