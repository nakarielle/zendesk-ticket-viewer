module ApplicationHelper
  def parse_time(time)
    Time.parse(time).strftime('%e %b %Y %H:%M:%S%p') 
  end
end
