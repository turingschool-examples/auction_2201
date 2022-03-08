class Attendee

  attr_reader :name, :budget
  def initialize(information)
    @name = information[:name]
    @budget = information[:budget].delete("$").to_i
  end


end
