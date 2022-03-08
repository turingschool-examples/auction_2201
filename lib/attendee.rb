class Attendee
  attr_reader :name, :budget, :attributes
  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @budget = attributes[:budget].delete("$").to_i
  end
end
