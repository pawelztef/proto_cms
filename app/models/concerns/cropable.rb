module Cropable
  include ActiveSupport::Concern

  def crop_with_options(options = {})
    image = MiniMagick::Image.open(url_for(self.attachment))
    image.combine_options do |b|
      b.resize "50x00"
      b.rotate "-40"
      b.flip
    end
    file = File.open(image.path)
    filename = Time.zone.now.strftime("%Y%m%d%H%M%S") + self.attachment.blob.filename.to_s
    self.attachment.attach(io: file, filename: filename)
    self.save
  end

end
