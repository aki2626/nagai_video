json.array! @video.tag_list do |tag|
  json.id tag.id
  json.name tag.name
end