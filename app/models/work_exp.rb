class WorkExp < ActiveRecord::Base
  belongs_to :employee
  has_attached_file :document,
	:storage => :s3,
	:s3_permissions => 'public-read-write',
	:url => "s3-us-west-2.amazonaws.com/honducariberrhh",
	:path => "/assets/documents/:employee_id/:id/:basename.:extension",
	:s3_host_name => "s3-us-west-2.amazonaws.com",
  s3_credentials: {
    bucket: 'honducariberrhh',
    access_key_id: 'AKIAID2VBHCVFGZAJ4SQ',
    secret_access_key: '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',
    s3_region: 'us-west-2',
  }


	validates_attachment_content_type :document, :content_type => ["image/jpg", "image/jpeg", "image/png",  "application/force-download", "application/doc", "application/docx"]
end
