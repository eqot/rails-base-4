require 'uri'

module ApplicationHelper

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

  def bootstrap_class_for(level)
    case level
      when "success" then "alert-success"
      when "notice"  then "alert-info"
      when "alert"   then "alert-warning"
      when "error"   then "alert-danger"
    end
  end

  def filename(file)
    URI.decode(File::basename(file.to_s))
  end

end
