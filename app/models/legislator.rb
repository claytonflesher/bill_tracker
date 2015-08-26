class Legislator
  def initalize(rep)
    @first_name    = rep["first_name"]
    @middle_name   = rep["middle_name"]
    @last_name     = rep["last_name"]
    @district      = rep["district"]
    @state         = rep["state"]
    @committees    = rep["roles"].map { |role| role["committee"] }.compact
    @email         = rep["email"]
    @party         = rep["party"]
  end

  attr_reader :first_name, :middle_name, :last_name,
              :district, :state, :committees
              :email, :party
end
