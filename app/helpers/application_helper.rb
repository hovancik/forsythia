module ApplicationHelper
  def formatted_time(time)
    time.strftime("%l:%M %p") if time
  end

  def formatted_day(time)
    time.strftime("%e") if time
  end
end
