class MadeReport < ActiveRecord::Base
	has_attached_file :image, styles: { original: "1920x1680#",medium: "300x300>", thumb: "100x100>" }, default_url: "/system/missing/:style/missing.jpg"

 validates_attachment :image, presence: true,
 content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
 size: { less_than: 2.megabytes }
 belongs_to :recipe
 validates :message, presence: true
end
