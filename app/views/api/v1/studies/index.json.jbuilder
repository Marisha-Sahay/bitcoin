json.array! @resources.each do |resource|
  json.name resource.name
  json.description resource.description
end