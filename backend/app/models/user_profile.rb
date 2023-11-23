class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_image, ProfileImageUploader # You need to create this uploader

  def save(*args, **kwargs)
    # Set the username to the User model's username if it's not set
    self.username ||= user.username

    # Construct the full_name from User model's first_name and last_name if it's not set
    self.full_name ||= "#{user.first_name} #{user.last_name}"

    # Check if a profile image with the same username exists
    if profile_image.present?
      existing_image = UserProfile.where(id: id).pluck(:profile_image).first
      if existing_image.present? && existing_image != profile_image.identifier
        # Delete the old image file
        existing_image_path = File.join(ProfileImageUploader.root, 'user_profiles', existing_image)
        File.delete(existing_image_path) if File.exist?(existing_image_path)
      end
    end

    super
  end

  def to_s
    user.username
  end

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
