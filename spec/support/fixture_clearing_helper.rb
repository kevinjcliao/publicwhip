module FixtureClearningHelpers
  # TODO Figure out why we need to do this horrible hack to remove the fixtures
  # we shouldn't have them loaded
  def clear_db_of_fixture_data
    Person.delete_all
    Member.delete_all
    Division.delete_all
    Vote.delete_all
    Whip.delete_all
    User.delete_all
    Policy.delete_all
    PolicyDivision.delete_all
    PolicyPersonDistance.delete_all
    WikiMotion.delete_all
  end
end