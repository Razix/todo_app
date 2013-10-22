CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIE3RBKCEWRSOQAEA',
    aws_secret_access_key: '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'
  }
  config.fog_directory  = 'project_img_bucke'
end