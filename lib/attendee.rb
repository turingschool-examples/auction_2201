require 'item'

class Attendee
  attr_reader :name, :budget

  def initialize(attritutes)
    @name = attritutes[:name]
    @budget = attritutes[:budget].delete('$').to_i
  end

end
