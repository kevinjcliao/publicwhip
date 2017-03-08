class DivisionParameterParser
  YEAR_ONLY_REGEX = /^\d{4}$/
  YEAR_AND_MONTH_REGEX = /^\d{4}-\d{1,2}$/
  COMPLETE_DATE_REGEX = /^\d{4}-\d{1,2}-\d{1,2}$/

  def self.get_date_range(date)
    if date =~ YEAR_ONLY_REGEX
      return get_year_range(date)
    elsif date =~ YEAR_AND_MONTH_REGEX
      return get_month_range(date)
    elsif date =~ COMPLETE_DATE_REGEX
      return get_day_range(date)
    else
      raise ArgumentError, 'Not a valid date format'
    end
  end

private

  def self.get_year_range(year)
    date = Date.parse("#{year}-01-01")

    return date, date + 1.year, :year
  end

  def self.get_month_range(partial_date)
    year, month = partial_date.split('-')
    date = Date.parse("#{year}-#{month}-01")

    return date, date + 1.month, :month
  end

  def self.get_day_range(complete_date)
    year, month, day = complete_date.split('-')
    date = Date.parse("#{year}-#{month}-#{day}")

    return date, date + 1.day, :day
  end
end
