json.array! @video.tag_list do |tag|
  json.name tag
  json.array! @video.taggings do |tagging|
    json.id   tagging.id
  end
end
# json.array! @video.taggings do |tagging|
#   json.id   tagging.id
# end
