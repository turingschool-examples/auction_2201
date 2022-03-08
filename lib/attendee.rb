class Attendee
  attr_reader :name

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget]
  end

  def budget
    @budget.delete('$').to_i
  end
end
