class Video < ApplicationRecord
  belongs_to :user

  has_attached_file :video,
                    :path => ':attachment/:id/:filename',
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml"

  do_not_validate_attachment_file_type :video

end
