# encoding: utf-8

class AudioUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
