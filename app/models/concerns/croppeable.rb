module Croppeable

  include ActiveSupport::Concern
  include ActionView::Helpers::NumberHelper
  include Rails.application.routes.url_helpers

  def crop_and_save_with_options(filename=nil, image_options = {})
    redraw_params = create_redraw_params(filename, image_options)
    processed_attachment_path = create_variant(redraw_params)
    save_new_file(processed_attachment_path)
  end

  private

  def create_redraw_params(filename, image_options)
    redraw_params = {}
    redraw_params[:crop] = "#{image_options[:width].to_i.round(1)}x#{image_options[:height].to_i.round(1)}+#{image_options[:x].to_i}+#{image_options[:y].to_i}"
    redraw_params[:rotate] = image_options[:rotate].to_i
    if image_options[:scaleX] == -1
      redraw_params[:flop] = true
    end
    if image_options[:scaleY] == -1
      redraw_params[:flip] = true
    end
    return redraw_params
  end

  def create_variant(redraw_params)
    #creating variant
    processed_attachment = self.attachment.variant(redraw_params).processed
    #absolute path to variant file
    return processed_attachment.service.send(:path_for, processed_attachment.key)
  end

  def save_new_file(filename = nil,  processed_attachment_path)
    file = File.open(processed_attachment_path)
    #create file name
    if(!filename.present?)
      filename = Time.zone.now.strftime("%Y%m%d%H%M%S") + self.attachment.blob.filename.to_s
    end
    #update media with new file
    self.attachment.attach(io: file, filename: filename)
    self.save!
  end

end
