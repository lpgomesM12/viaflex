class Fotoordemservice < ActiveRecord::Base
  belongs_to :serviceordem

  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

end
