require_relative 'data_formatter'
require 'csv'
require 'date'

module DataParser
  class BaseParser
    include DataFormatter

    def format_columns
      @data = @data.map { |x| [x['first_name'], self.format_city(x['city']), self.format_date(x['birthdate'])] }
    end
  end
end
