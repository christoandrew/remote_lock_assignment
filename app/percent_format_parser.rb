require_relative 'base_parser'

class PercentFormatParser < BaseParser
  DATE_FORMAT = '%Y-%m-%d'.freeze

  def parse(params, headers: nil)
    @data = CSV.parse(params[:data], headers: true, col_sep: ' % ')
    @headers = headers || @data.headers
    @order_by = params[:order]
    format_columns
  end
end

