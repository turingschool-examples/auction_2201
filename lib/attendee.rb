class Attendee
  attr_reader :name, :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].gsub(/[$]/, "").to_i
  end
end
