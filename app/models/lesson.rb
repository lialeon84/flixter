class Lesson < ApplicationRecord
  belongs_to :course
  has_many :lessons
  mount_uploader :video, VideoUploader
end
