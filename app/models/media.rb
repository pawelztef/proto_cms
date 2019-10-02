class Media < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  include Rails.application.routes.url_helpers
  has_one_attached :attachment


  def crop_and_save_with_options(filename=nil, image_options = {})

    #formating options
    crop_img_params = "#{image_options[:width].to_i.round(1)}x#{image_options[:height].to_i.round(1)}+#{image_options[:x].to_i}+#{image_options[:y].to_i}"
    rotate_img_params = image_options[:rotate]
    flip_img_params = image_options[:scaleX] == -1 ? "flip".to_sym : nil
    resize_img_params ="#{image_options[:width].to_i.round(1)}x#{image_options[:height].to_i.round(1)}" 
    #creating variant
    processed_attachment = self.attachment.variant(crop: crop_img_params, rotate: rotate_img_params, flip: flip_img_params).processed
    #absolute path to variant file
    processed_attachment_path = processed_attachment.service.send(:path_for, processed_attachment.key)

    #open new file
    file = File.open(processed_attachment_path)

    #create file name
    if(!filename.present?)
      filename = Time.zone.now.strftime("%Y%m%d%H%M%S") + self.attachment.blob.filename.to_s
    end

    #update media with new file
    self.attachment.attach(io: file, filename: filename)
    self.save!
  end

  def media_metadata
    metadata = {}
    metadata[:id] = self.id
    metadata[:name] = self.title 
    metadata[:url] = polymorphic_url(self.attachment, only_path: true)
    metadata[:size] = number_to_human_size(self.attachment.byte_size) 
    metadata[:dimension] = "#{self.attachment.metadata[:width]}x#{self.attachment.metadata[:height]}"
    return metadata
  end

end
