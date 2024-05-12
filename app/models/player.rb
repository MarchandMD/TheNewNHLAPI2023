class Player
  include ActiveModel::Model

  attr_accessor :id,
    :headshot,
    :name,
    :data,
    :sweater_number,
    :position_code,
    :shoots_catches,
    :height_in_inches,
    :weight_in_pounds,
    :birthdate,
    :birth_country,
    :hero_image
  validates :id,
    :headshot,
    :name,
    :data,
    :sweater_number,
    :position_code,
    :shoots_catches,
    :height_in_inches,
    :weight_in_pounds,
    :birthdate,
    :birth_country,
    presence: true

  def initialize(data)
    @data = data
    @name = full_name
    @headshot = data.fetch(:headshot)
    @sweater_number = data.fetch(:sweaterNumber)
    @shoots_catches = data.fetch(:shootsCatches)
    @height_in_inches = data.fetch(:heightInInches)
    @weight_in_pounds = data.fetch(:weightInPounds)
    @birthdate = data.fetch(:birthDate)
    @birth_country = data.fetch(:birthCountry)
    # in depth player specific data
    if data[:id].nil?
      @id = data.fetch(:playerId)
      @position_code = data[:position]
      @career_totals_regular_season = career_totals_regular_season
      @hero_image = data[:heroImage]
    else
      @id = data[:id]
      @position_code = data[:positionCode]
    end
  end

  def full_name
    "#{@data[:firstName][:default]} #{@data[:lastName][:default]}"
  end

  def career_totals_regular_season
    @data[:careerTotals][:regularSeason]
  end
end
