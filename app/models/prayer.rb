class Prayer < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user }

  mount_uploader :audio, AudioUploader

  belongs_to :user
  belongs_to :pain

  validates :title, presence: true, allows_blank: false
  validates :description, presence: true, allows_blank: false, if: :audio_blank?
  #validates :description, presence: true, allows_blank: false;

private

  def audio_blank?
    audio.blank?
  end
end
