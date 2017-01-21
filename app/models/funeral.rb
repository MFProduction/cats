class Funeral < ApplicationRecord
  belongs_to :customer
  before_create :set_end_time

  validates :cat_name, presence: true
  validate :cant_do_past

  private

  def set_end_time
    self.end_time = self.start_time+2.hour
  end


  def cant_do_past
    if start_time.present? && start_time < Time.now
      errors.add(:start_time, "can't book in the past")
    end
  end
end
