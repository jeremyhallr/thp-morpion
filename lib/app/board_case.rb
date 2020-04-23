class BoardCase
  attr_accessor :case_value, :case_id

  # Initialize each boardcase of the board
  def initialize(case_id)
    @case_id = case_id
    @case_value = " "
  end

end