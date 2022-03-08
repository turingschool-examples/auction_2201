
class Attendee

  attr_reader :name

  def initialize (info_hash)
    @name = info_hash[:name]
    @budget = info_hash[:budget]
  end

  def budget
    @budget.slice(1,@budget.length-1).to_i
  end
  
end
