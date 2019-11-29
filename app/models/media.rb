# == Schema Information
#
# Table name: media
#
#  id         :bigint           not null, primary key
#  caption    :text(65535)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Media < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  include Rails.application.routes.url_helpers
  include Croppeable

  has_one_attached :attachment


  def media_metadata
    metadata = {}
    metadata[:id] = self.id
    metadata[:name] = self.title 
    metadata[:url] = polymorphic_url(self.attachment, only_path: true)
    metadata[:size] = number_to_human_size(self.attachment.byte_size) 
    metadata[:dimension] = "#{self.attachment.metadata[:width]}x#{self.attachment.metadata[:height]}"
    metadata[:caption] = self.caption
    return metadata
  end

end
