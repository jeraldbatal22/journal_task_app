require "test_helper"

class JournalTest < ActiveSupport::TestCase

  def setup
    @journal = Journal.create(
      name: 'sample',
      description: 'sample description',
      user_id: 1,
      )
  end

  test "should invalid journal" do
    assert_not @journal.valid?
  end

  test "should invalid name if empty" do
    @journal.name = ''
    assert_not @journal.valid?
  end

  test "should invalid description if empty" do
    @journal.description = ''
    assert_not @journal.valid?
  end

  test "should invalid unique name" do
    @journal1 = Journal.create(
      name: 'sample',
      description: 'sample description',
      user_id: 1,
      )
    assert_not @journal1.valid?
  end

  test "should invalid if description less than 4 characters" do
    @journal.description = 'hey'
    assert_not @journal.valid?
  end

end
