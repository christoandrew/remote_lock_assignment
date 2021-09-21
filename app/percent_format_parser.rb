module DataParser
  class PercentFormat < DataParser::BaseParser
    DATE_FORMAT = '%Y-%m-%d'.freeze

    def parse(params)
      @data = CSV.parse(params[:data], headers: true, col_sep: ' % ')
      [@data.headers, format_columns]
    end
  end
end
