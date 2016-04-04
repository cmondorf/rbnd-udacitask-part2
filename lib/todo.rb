class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :class

  def initialize(description, options={})
    @description = description
    @class = "TodoItem"
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(:class => @class, :due => @due) +
    format_priority(@priority)
  end
end
