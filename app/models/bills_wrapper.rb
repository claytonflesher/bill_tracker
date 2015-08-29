require "open-uri"
class BillsWrapper
  def self.call(bill_name:)
    bill = normalize(bill_name)
    url  = "http://www.oklegislature.gov/BillInfo.aspx?Bill=#{bill}&Session=1500"
    page = Nokogiri::HTML(open(url))
    page.css("div#open table")[3].text.strip
  end

  def self.normalize(bill_name)
    bill_name.to_s
             .gsub(/[\s]/, "")
             .upcase
  end

  private_class_method :normalize
end
