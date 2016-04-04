module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(options={})
    if options[:class]=="TodoItem"
      options[:due] ? options[:due].strftime("%D") : "No due date"
      #placeholder for format date method for events
    end
    #if due -> process as due
  end

  def format_priority
  end
end
