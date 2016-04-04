class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :class

  def initialize(description, options={})
    @description = description
    @class = "TodoItem"
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  # def format_date
  #   @due ? @due.strftime("%D") : "No due date"
  # end
  def format_priority
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end
  def details
    format_description(@description) + "due: " +
    format_date(:class => @class, :due => @due) +
    format_priority
  end
end
