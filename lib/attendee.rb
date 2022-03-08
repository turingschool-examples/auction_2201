class Attendee
  attr_reader :name, :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget]
  end

  def budget_to_f
    @budget.gsub('$', '').to_f
  end
end
