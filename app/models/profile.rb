class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_or_last_name_nil
  validates :gender, inclusion: { in: ["male", "female"] }
  validate :male_has_name_sue

  def first_or_last_name_nil
    if first_name.nil? && last_name.nil?
      errors.add(:last_name, "cannot both be nil!")
    end
  end

  def male_has_name_sue
    if gender == "male" && first_name == "Sue"
      errors.add(:first_name, "not a male name!")
    end
  end
end
