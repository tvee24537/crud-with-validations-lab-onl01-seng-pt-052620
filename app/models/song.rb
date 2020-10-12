class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:artist_name, :release_year],
    message: "cannot be repeated by the same artist in the same year"
  }

  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  validates :release_year, presence: true, if: :sent? 
  validates :release_year, numericality: {less_than_or_equal_to: Date.current.year }, if: :sent? 
  validates :artist_name, presence: true

  def sent?
    released
  end 

end