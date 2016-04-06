class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    unless ["todo", "event", "link"].include? type
      raise UdaciListErrors::InvalidItemType, "This is an unkown or invalide type."
    end
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end

  def delete(*args)
    counter = 0
    while counter < args.length
      if args[counter]> @items.length
        raise UdaciListErrors::IndexExceedsListSize, "This index number #{args[counter]} is too high."
      end
      @items.delete_at(args[counter]-1)
      counter += 1
    end
  end

  def all
    rows = []
    @title = "Untitled List" if !@title
    @items.each_with_index do |item, position|
      rows << [ "#{position + 1})", "#{item.details}"]
    end
    table = Terminal::Table.new :title => "#{@title}, Total entries: #{@items.length}", :headings => ['Item', 'Details'], :rows => rows
    puts table
  end

  def type_match(type)
    if type == "event"
      return "EventItem"
    elsif type == "todo"
      return "TodoItem"
    else
      return "LinkItem"
    end
  end

  def filter(type)
    rows = []
    @title = "Filtered list - #{type}"
    matched_type = type_match(type)
    i = 1
    @items.each_with_index do |item|
      if item.class== matched_type
        rows << [ "#{i})", "#{item.details}"]
        i += 1
      end
    end
    table = Terminal::Table.new :title => "#{@title}, Total entries: #{i-1}", :headings => ['Item', 'Details'], :rows => rows
    puts table
  end

end
