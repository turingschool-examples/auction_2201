class Attendee
  attr_reader :name, :budget
  def initialize(arguments)
    @name = arguments[:name]
    @budget = arguments[:budget][1..-1].to_i
  end
end
