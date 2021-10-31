# frozen_string_literal: true

json.points @points.each do |point|
  json.partial! point
end
