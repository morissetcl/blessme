class ConversionWorker
  include Sidekiq::Worker

  def perform(file_name)
    prayer = file_namer
    path = "#{Rails.root}/tmp#{file_name}"
    mp = path.gsub(/mp3$/, "wav")
    yup = %x[ffmpeg -i #{path} -acodec libvorbis #{mp}]
  end
end
