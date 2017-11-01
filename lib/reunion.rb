require 'pry'
class Reunion
  attr_reader :activities
              :participant_name

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activities(activity)
    @activities << activity
  end

  def total_reunion_cost
    @activities.map{|activity|activity.total_cost}.sum
  end

  def cost_split_for_reunion
    @participant_name = @activities.map {|activity|activity.participants}.flatten.map{|participant|participant[:name]}
    total_reunion_cost/@participant_name.count
  end

  def cost_owed_per_person_for_reunion
    cost_split_for_reunion
       participant_paid=  @activities.map{|activity|activity.participants}.flatten.map{|participant| participant[:paid]}
       participants_paid = @participant_name.zip(participant_paid).flatten!
     participants_paid.each_with_index do |participant,index|
        p "#{participant[index]} has a balance of #{participant[index+1]}"
     end

  end

end
