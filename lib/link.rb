class LinkItem
  include Listable
  attr_reader :description, :site_name, :class

  def initialize(url, options={})
    @description = url
    @class = "LinkItem"
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end
  def details
    "(Link) " + format_description(@description) + "site name: " + format_name
  end
end
