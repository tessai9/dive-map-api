# frozen_string_literal: true

json.regions @regions.each do |region|
  json.partial! region
end
