require_relative 'dollar_format_parser'
require_relative 'percent_format_parser'

module DataParser
  def self.parse(params)
    _, dollar_format_data = DataParser::DollarFormat.new.parse({ data: params[:dollar_format] })
    percent_headers, percent_format_data = DataParser::PercentFormat.new.parse({ data: params[:percent_format] })

    order_by_column = percent_headers.index(params[:order].to_s) || 0
    (dollar_format_data + percent_format_data).sort_by { |x|
      x[order_by_column]
    }.map { |x| x.join(', ') }.flatten
  end
end
