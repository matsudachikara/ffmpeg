class Article < ApplicationRecord
  mount_uploader :video_url, VideoUploader

  validates :title, :video_url, :presence => true
end
