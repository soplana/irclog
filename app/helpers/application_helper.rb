module ApplicationHelper

  def month_for_week_each year, month=Time.now.month, &block
    start_day = Date.new year, month
    end_day   = Date.new year, month, -1
  
    (Array.new(start_day.wday) + (1..end_day.day).to_a).each_slice(7) do |weeks|
      block.call weeks.map{|w| w.nil? ? nil : Date.new(year, month, w)}
    end
  end

  def to_params_day day
    {
      year:   day.year,
      month:  day.month,
      day:    day.day
    }
  end

  def day_path day
    if day.nil?
      "javascript:void(0)"
    else
      logs_show_path(to_params_day day)
    end
  end
end
