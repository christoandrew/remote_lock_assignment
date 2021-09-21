require_relative 'data_parser'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    DataParser.parse(params)
  end

  private

  attr_reader :params
end
