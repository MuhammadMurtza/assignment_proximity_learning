class Employment < ApplicationRecord
  belongs_to :user

  validates :employer, presence: true, length: {maximum: 250}
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :validate_start_date
  validate :validate_end_date

  def validate_start_date
    return unless start_date.present?
    errors.add(:start_date, "cannot be greater than end_date") if start_date > end_date
    errors.add(:start_date, "cannot be in the future") if start_date > Date.today
  end

  def validate_end_date
    return unless end_date.present?
    errors.add(:end_date, "should be greater than start date") if end_date < start_date
    errors.add(:end_date, "cannot be in the future") if end_date > Date.today
  end
end
