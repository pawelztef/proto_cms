class Media < ApplicationRecord
  include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
  has_one_attached :attachment


  def crop_and_save_with_options(filename=nil, image_options = {})

    crop_img_params = "#{image_options[:width]}x#{image_options[:height]}+#{image_options[:left]}+#{image_options[:top]}"

    rotate_img_params = image_options[:scaleY] == -1 ? image_options[:rotate] + 180 : image_options[:rotate]
    flip_img_params = image_options[:scaleX] == -1


    image = MiniMagick::Image.open(url_for(self.attachment))
    image.combine_options do |b|
      binding.pry
      b.crop crop_img_params 
      b.rotate  rotate_img_params
      b.flip if flip_img_params
    end

    file = File.open(image.path)

    if(!filename.present?)
      filename = Time.zone.now.strftime("%Y%m%d%H%M%S") + self.attachment.blob.filename.to_s
    end

    self.attachment.attach(io: file, filename: filename)
    self.save!

  end

end
