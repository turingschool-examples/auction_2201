require 'pry'
require './lib/attendee'

class Attendee
  attr_reader :name, :budget

  def initialize(hash)
    @name = hash[:name]
    @budget = hash[:budget].delete('$').to_i
  end


end
