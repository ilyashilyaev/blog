class AttachmentUploader < BaseUploader

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
