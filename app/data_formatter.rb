module DataFormatter
  CITY_ABBREVIATIONS = {
    'LA' => 'Los Angeles',
    'NYC' => 'New York City'
  }.freeze

  def format_city(iso_or_city_name)
    CITY_ABBREVIATIONS[iso_or_city_name] || iso_or_city_name
  end

  def format_date(date)
    begin
      Date.strptime(date, self.class::DATE_FORMAT).strftime('%-m/%-d/%Y')
    rescue ArgumentError => e
      print "Error Parsing date #{e.message}"
      date
    end
  end
end
