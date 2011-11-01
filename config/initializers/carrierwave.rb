S3_CONFIG = if Rails.env.production?
              {
                "fog_credentials" => {
                  "provider"              => 'AWS',
                  "aws_access_key_id"     => ENV["S3_KEY"],
                  "aws_secret_access_key" => ENV["S3_SECRET"]
                },
                "fog_directory" => ENV["S3_BUCKET"]
              }
            else
              YAML.load_file Rails.root.join("config", "s3.yml")
            end
S3_CONFIG.symbolize_keys!

class CarrierWave::Storage::Fog::File
  def copy(to)
    connection.copy_object(@uploader.fog_directory, @path, @uploader.fog_directory, "#{@uploader.store_dir}/#{to}", 'x-amz-acl' => (@uploader.fog_public ? 'public-read' : 'authenticated_read'))
  end

  def move(to)
    copy(to)
    delete
  end
end

CarrierWave.configure do |config|
  config.root      = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.fog_credentials = S3_CONFIG[:fog_credentials].symbolize_keys
  config.fog_directory   = S3_CONFIG[:fog_directory]
end
