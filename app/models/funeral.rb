class Funeral < ApplicationRecord
  belongs_to :customer
  before_create :set_end_time

  validates :cat_name, presence: true
  validate :cant_do_past
  #validate :slot_taken #TODO: only works for first hour because of timezone

  private

  def set_end_time
    self.end_time = self.start_time+2.hour
  end

  def cant_do_past
    if start_time.present? && start_time < Time.now
      errors.add(:start_time, "can't book in the past")
    end
  end

  def slot_taken
    if Funeral.where(start_time: start_time.beginning_of_hour..(start_time+1.hour).end_of_hour).present?
      errors.add(:start_time, "slot already taken")
    end
  end
end
