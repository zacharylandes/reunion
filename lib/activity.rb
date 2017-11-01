class Activity
  attr_reader  :participants
  
  def initialize(name)
    @name= name
    @participants = []
  end

  def add(participant)
    @participants << participant
  end

  def total_cost
   @participants.map {|participant| participant[:paid]}.sum
  end

  def cost_split
    total_cost/@participants.count
  end

  def cost_owed_per_person
    @participants.map do |participant|
      cost_owed = cost_split - participant[:paid]
        "#{participant[:name]} has a balance of #{cost_owed}"
     end
  end
end
#
# swim = Activity.new("swim" )
# swim.add({:name=> "joe",:paid => 12})
# swim.add({:name=> "joe",:paid => 34})
# swim.add({:name=> "joe",:paid => 23})
# swim.total_cost
# swim.cost_split

# p @participants
