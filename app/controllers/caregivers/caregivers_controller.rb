class Caregivers::CaregiversController < ApplicationController
  before_action :authenticate_caregiver!
  layout 'front'
  def index
  end
end
