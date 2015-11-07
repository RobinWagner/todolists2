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

  def self.get_all_profiles(min_birth_year, max_birth_year)
    Profile.where("birth_year BETWEEN :min_year and :max_year", min_year: min_birth_year, max_year: max_birth_year).order(birth_year: :asc)
  end
end
