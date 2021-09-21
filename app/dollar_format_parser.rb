class DollarFormatParser < BaseParser
  DATE_FORMAT = '%d-%m-%Y'.freeze

  def parse(params, headers: nil)
    @data = CSV.parse(params[:data], headers: true, col_sep: ' $ ')
    @headers = headers || @data.headers
    @order_by = params[:order]
    format_columns
  end
end
