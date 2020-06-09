class VideoMylist < ApplicationRecord
  belongs_to  :Video
  belongs_to  :mylist
end
