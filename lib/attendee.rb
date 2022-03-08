class Attendee
  attr_reader :name, :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget][1..-1].to_i
  end
end