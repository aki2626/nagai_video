class VideoMylist < ApplicationRecord
  belongs_to  :video
  belongs_to  :mylist
end
