require_relative 'percent_format_parser'
require_relative 'dollar_format_parser'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    dollar_format_data = DollarFormatParser.new.parse({data: params[:dollar_format], order: params[:order]})
    percent_format_data = PercentFormatParser.new.parse({data: params[:percent_format], order: params[:order]})
    (dollar_format_data + percent_format_data).sort_by{ |x| x[0]}.map{|x| x.join(', ')}.flatten
  end

  private

  attr_reader :params
end
