require_relative 'data_formatter'
require 'csv'
require 'date'

class BaseParser
  include DataFormatter

  def order
    @data = @data.sort_by { |x| x[@headers.index(@order_by)] }
  end

  def format_columns
    @data = @data.map { |x| [x['first_name'], format_city(x['city']), format_date(x['birthdate'])] }
  end

  def merge(data)
    @data += data
  end
end
