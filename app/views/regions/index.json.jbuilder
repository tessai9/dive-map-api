json.regions @regions.each do |region|
  json.partial! region
end
