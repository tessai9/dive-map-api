json.points @points.each do |point|
  json.partial! point
end
