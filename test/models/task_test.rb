require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.create(
      name: 'sample',
      description: 'sample description'
      )
  end

  test "should invalid task" do
    assert_not @task.valid?
  end

  test "should invalid task name if empty" do
    @task.name = ''
    assert_not @task.valid?
  end

  test "should invalid task description if empty" do
    @task.description = ''
    assert_not @task.valid?
  end

  test "should invalid unique name" do
    @task1 = Task.create(
      name: 'sample',
      description: 'sample description',
      journal_id: 1,
      )
    assert_not @task1.valid?
  end

  test "should invalid if description less than 4 characters" do
    @task.description = 'hey'
    assert_not @task.valid?
  end
  
end
