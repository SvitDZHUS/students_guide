# frozen_string_literal: true

class FileUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[pdf doc docx]
  end

  def filename
    "file.#{file.extension}" if original_filename
  end
end
