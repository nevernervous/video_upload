class Video < ApplicationRecord
  belongs_to :user

  has_attached_file :video,
                    :path => ':attachment/:id/:filename',
                    :storage => :s3,
                    :s3_region => 'ap-northeast-1',
                    :s3_host_name => 's3-ap-northeast-1.amazonaws.com',
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }


  do_not_validate_attachment_file_type :video

  def s3_credentials
    {
        :bucket => 'eziovideo',
        :access_key_id => 'AKIAIJXQLL5EFXFRLQWA',
        :secret_access_key => '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'
    }
  end

end
