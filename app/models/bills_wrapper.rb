require "open-uri"
class BillsWrapper
  def self.call(bill_name:)
    bill = normalize(bill_name)
    url  = "http://www.oklegislature.gov/BillInfo.aspx?Bill=#{bill}"
    page = Nokogiri::HTML(open(url))
    arrange(page)
  end

  def self.normalize(bill_name)
    bill_name.to_s
             .gsub(/[\s]/, "")
             .upcase
  end

  def self.arrange(page)
    page.css("div#open table")[3].text
      .strip
      .gsub(/\r|\n|\t/, " ")
      .split(/ {2,}/)
  end

  private_class_method :normalize, :arrange
end
