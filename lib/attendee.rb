class Attendee
  attr_reader :budget,
              :name

  def initialize(info)
    @budget = info[:budget].delete('$')
    @name = info[:name]
  end
end
