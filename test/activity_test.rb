require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_creates_an_activity
    act = Activity.new("swimming")

    assert_instance_of Activity, act
  end
  def test_it_can_add_participants
    act = Activity.new("swimming")
    act.add({:name=>"joe", :paid=>24})

    assert_equal 1, act.participants.count
  end

  def test_it_can_sum_participants
    swim = Activity.new("swim" )
    swim.add({:name=> "joe",:paid => 12})
    swim.add({:name=> "jill",:paid => 34})
    swim.add({:name=> "jack",:paid => 23})

    assert_equal 69,   swim.total_cost
  end
  def test_it_can_split_the_cost_of_activities
    swim = Activity.new("swim" )
    swim.add({:name=> "joe",:paid => 12})
    swim.add({:name=> "jill",:paid => 34})
    swim.add({:name=> "jack",:paid => 23})
    swim.total_cost

    assert_equal 23,   swim.cost_split
  end

  def test_it_can_tell_who_owes_how_much
    swim = Activity.new("swim" )
    swim.add({:name=> "joe",:paid => 12})
    swim.add({:name=> "jill",:paid => 34})
    swim.add({:name=> "jack",:paid => 23})
    swim.total_cost
    swim.cost_split
    result = ["joe has a balance of 11",
       "jill has a balance of -11", "jack has a balance of 0"]

    assert_equal result, swim.cost_owed_per_person
  end


end
