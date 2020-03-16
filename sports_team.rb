require('minitest/autorun')
require('minitest/reporters')
require_relative('../sports_team')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestTeam < MiniTest::Test

def setup()
  @md = Team.new("Mighty Ducks", ["Fulton Reed", "Jessie Hall", "Charlie Conway"],"Bombay",0)
end
# Make a class to represent a Team that has the properties Team name (String), Players (array of strings) and a Coach (String).
# For each property in the class make a getter method than can return them.
# Create a setter method to allow the coach’s name to be updated.
# Refactor the class to use attr_reader or attr_accessor instead of your own getter and setter methods.
# Create a method that adds a new player to the players array.
# Add a method that takes in a string of a player’s name and checks to see if they are in the players array.
# Add a points property into your class that starts at 0.
# Create a method that takes in whether the team has won or lost and updates the points property for a win.
def test_team_name()
    assert_equal("Mighty Ducks", @md.team_name())
  end

  def test_players_name()
    assert_equal(["Fulton Reed", "Jessie Hall", "Charlie Conway"], @md.players_name())
  end

  def test_coach_name()
    assert_equal("Bombay", @md.coach_name())
  end

  def test_set_coach_name()
    @md.set_coach_name("Gordon")
    assert_equal("Gordon", @md.coach_name())
  end

  def test_add_new_player()
    new_player = @md.add_new_player("John")
    assert_equal(["Fulton Reed", "Jessie Hall", "Charlie Conway", "John"], new_player)
  end

def test_find_players_false()
  find = @md.find_players("Kiki")
  assert_equal(false, find)
end

def test_find_players_true()
  find = @md.find_players("Fulton Reed")
  assert_equal(true, find)
end

  def test_team_won()
    @md.team_won("win")
    assert_equal(3, @md.points)
  end

end
