require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_creates_a_reunion
    farm = Reunion.new("farm")
    # act = Activity.new("swimming")

    assert_instance_of Reunion, farm
  end

  def test_it_can_add_activities
    act = Activity.new("swimming")
    farm = Reunion.new("farm")
    farm.add_activities(act)

    assert_equal 1, farm.activities.count
  end

  def test_it_can_get_total_cost_of_reunion
    farm = Reunion.new("farm")
    swim = Activity.new("swim" )
    swim.add({:name=> "joe",:paid => 12})
    swim.add({:name=> "jill",:paid => 34})
    swim.add({:name=> "jack",:paid => 23})
    farm.add_activities(swim)
    archery = Activity.new("archery" )
    archery.add({:name=> "joe",:paid => 32})
    archery.add({:name=> "jill",:paid => 24})
    archery.add({:name=> "jack",:paid => 563})
    farm.add_activities(archery)


    assert_equal 688, farm.total_reunion_cost
  end
  def test_it_can_get_average_amount_for_reunion
    farm = Reunion.new("farm")
    swim = Activity.new("swim" )
    swim.add({:name=> "joe",:paid => 12})
    swim.add({:name=> "jill",:paid => 34})
    swim.add({:name=> "jack",:paid => 23})
    farm.add_activities(swim)
    archery = Activity.new("archery" )
    archery.add({:name=> "jim",:paid => 32})
    archery.add({:name=> "jon",:paid => 24})
    archery.add({:name=> "jerry",:paid => 563})
    farm.add_activities(archery)
# binding.pry

    assert_equal 114, farm.cost_split_for_reunion
  end
  def test_it_can_get_amount_owed_per_person_for_reunion
    farm = Reunion.new("farm")
    swim = Activity.new("swim" )
    swim.add({:name=> "joe",:paid => 12})
    swim.add({:name=> "jill",:paid => 34})
    swim.add({:name=> "jack",:paid => 23})
    farm.add_activities(swim)
    archery = Activity.new("archery" )
    archery.add({:name=> "jim",:paid => 32})
    archery.add({:name=> "jon",:paid => 24})
    archery.add({:name=> "jerry",:paid => 563})
    farm.add_activities(archery)
    result = ["joe", 12, "jill", 34, "jack", 23, "jim", 32, "jon", 24, "jerry", 563]
# binding.pry

    assert_equal result , farm.cost_owed_per_person_for_reunion
  end



end
