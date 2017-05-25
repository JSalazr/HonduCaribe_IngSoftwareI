class Education < ActiveRecord::Base
	belongs_to :employee
	has_attached_file :document,
	:storage => :s3,
	:s3_permissions => 'public-read-write',
	:url => "s3-us-west-2.amazonaws.com/honducariberrhh",
	:path => "/assets/documents/:id/:basename.:extension",
	:s3_host_name => "s3-us-west-2.amazonaws.com",
	s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION'),
  }

	validates_attachment_content_type :document, :content_type => ["application/force-download", "application/doc", "application/docx"]
end
