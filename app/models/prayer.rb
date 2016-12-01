class Prayer < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }, recipient: :user_id

  belongs_to :user
  belongs_to :pain

  validates :title, presence: true, allows_blank: false;
  validates :description, presence: true, allows_blank: false;

end
