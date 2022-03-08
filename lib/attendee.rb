
class Attendee
  attr_reader :name
  def initialize(data)
    @name = data[:name]
    @budget = data[:budget]
  end

  def budget
    @budget.strip.delete("$").to_i
  end

end
