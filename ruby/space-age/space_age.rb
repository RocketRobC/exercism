class SpaceAge
  ORBITAL_PERIODS = {
    'earth' => 1,
    'mercury' => 0.2408467,
    'venus'   => 0.61519726,
    'mars'    => 1.8808158,
    'jupiter' => 11.862615,
    'saturn'  => 29.447498,
    'uranus'  => 84.016846,
    'neptune' => 164.79132
  }.freeze

  EARTH_YEAR_SECONDS = 31_557_600.00

  def self.generate_methods
    ORBITAL_PERIODS.each do |planet, ratio|
      define_method("on_#{planet}") do
        div = EARTH_YEAR_SECONDS * ratio
        @age_in_seconds / div
      end
    end
  end
  generate_methods

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end
end

module BookKeeping
  VERSION = 1
end
