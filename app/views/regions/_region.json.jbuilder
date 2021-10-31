# frozen_string_literal: true

json.id region.id
json.name region.name
json.set! :prefecture do
  json.id region.prefecture_id
  json.name region.prefecture_name
end
