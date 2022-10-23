module ApplicationHelper
  def declension count
    if ((11..14).include? count % 100) ||
      ((5..9).include? count % 10) ||
      (count % 10 == 0)
      "third"
    elsif count % 10 == 1
      "first"
    else
      "second"
    end
  end

  def counter(count, data)
    " " + t("#{data}.#{declension(count)}").downcase
  end

  def separator item
    item.digits(1000).reverse.join(",")
  end

  def time_ago(date)
    time_periods = [1, 60, 3600, 86400, 2592000, 31536000] #sec, min, hour, day, month, year
    time_names = {0 => 'time.seconds', 1 => 'time.minutes', 2 => 'time.hours', 3 => 'time.days', 4 => 'time.months', 5 => 'time.years'}

    difference_time = Time.now - Time.parse(date.to_s)

    current_periods =
      time_periods.map { |period| (difference_time / period).round }

    current_period_index = current_periods.find_index(current_periods.min)

    time_name =
      if current_periods[current_period_index] > 0 && current_period_index == 5
        counter(current_periods[5], time_names[5])
      else
        counter(current_periods[current_period_index - 1], time_names[current_period_index - 1])
      end

    "#{current_periods[current_period_index - 1]} #{time_name}"
  end
end
