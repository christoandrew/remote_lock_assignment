require_relative 'base_parser'

module DataParser
  class DollarFormat < DataParser::BaseParser
    DATE_FORMAT = '%d-%m-%Y'.freeze

    def parse(params)
      @data = CSV.parse(params[:data], headers: true, col_sep: ' $ ')
      [@data.headers, format_columns]
    end
  end
end
