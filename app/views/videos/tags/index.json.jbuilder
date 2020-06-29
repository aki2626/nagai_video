json.array! @video.taggings  do |tagging|
  json.id   tagging.id
  json.name tagging.tag.name
end  

