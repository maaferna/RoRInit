class ProfileImageUploader < CarrierWave::Uploader::Base
    # Choose what kind of storage to use for this uploader
    storage :file
  
    # Override the directory where uploaded files will be stored.
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url(*args)
      ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default_profile.png"].compact.join('_'))
    end
  
    # Process files as they are uploaded:
    process resize_to_fill: [200, 200]
  
    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_whitelist
      %w(jpg jpeg gif png)
    end
  end
