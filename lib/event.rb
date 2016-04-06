class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :class

  def initialize(description, options={})
    @description = description
    @class = "EventItem"
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
  end

  def details
    "(Event) " + format_description(@description) + "event dates: " + format_date(:class => @class, :start_date => @start_date)
  end
end
