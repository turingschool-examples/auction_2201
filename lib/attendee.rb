class Attendee
  attr_reader :name, :budget

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget].delete_prefix("$").to_i
  end
end
