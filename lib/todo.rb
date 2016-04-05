class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :class

  def initialize(description, options={})
    @description = description
    @class = "TodoItem"
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    if options[:priority]
      unless ["low", "medium", "high"].include? options[:priority]
        raise UdaciListErrors::InvalidPriorityValue, "Invalid priority. Please select low, medium, high, or leave blank."
      end
    end
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(:class => @class, :due => @due) +
    format_priority(@priority)
  end
end
