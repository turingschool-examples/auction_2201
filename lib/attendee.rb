class Attendee

  attr_reader :name
  attr_accessor :budget

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget][1..-1].to_i
  end


end
