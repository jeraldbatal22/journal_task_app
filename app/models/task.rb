class Task < ApplicationRecord
  belongs_to :journal
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 4 }
  validate :deadline_not_past
  validates :deadline, presence: true
  
  private

  def deadline_not_past
    return if (deadline.nil? or deadline.today?)
 
    if self.new_record?
      return errors.add(:deadline, "is already past") if deadline.past?
    end

    unless self.new_record?
      old_deadline, new_deadline = self.deadline_change

      return if old_deadline.nil?

      return if ((new_deadline == old_deadline) and !new_deadline.past?)

      return errors.add(:deadline, "is already past") if new_deadline.past?
    end
  end
end
