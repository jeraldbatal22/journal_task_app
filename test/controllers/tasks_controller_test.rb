require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest

  def setup
    @task = Task.create(name: "Test name", description: "Test description")
  end

  test "Should go to tasks_new_path" do
    assert_routing({ method: 'get', path: journals_tasks_new_path(id: 1)}, { controller: 'tasks', action: 'new', id: "1" })
  end
  
  test "Should check if have a route create and create method" do
    assert_routing({ method: 'post', path: journals_tasks_new_path(id: 1)}, { controller: 'tasks', action: 'create', id: "1" })
  end
  
  test "Should create new journal" do
    post journals_tasks_new_path(id: 1), params: { task: { name: "Test 1 name", description: 'Test 1 description', deadline: "2021-08-27 00:00:00" } }
    assert_response :redirect
  end

  test "Should go to task_edit_path" do
    assert_routing({ method: 'get', path: journals_tasks_edit_path(id: 1, task_id: 1)}, { controller: 'tasks', action: 'edit', id: "1" , task_id: "1"})
  end

  test "Should task journal" do
    patch journals_tasks_update_path(id: 1, task_id: 1), params: { journal: { name: "Updated Test Name", description: "Updated Test Description", id: "1" , task_id: "1" } }
  end

  test "Should check if have a route delete and delete method" do
    assert_routing({ method: 'delete', path: journals_tasks_delete_path(id: 1, task_id: 1)}, { controller: 'tasks', action: 'delete',  id: "1" , task_id: "1"  })
  end

  test "Should delete task" do
    delete journals_delete_path(id: 1, task_id: 1), params: { 
      journal: { name: "Test 1 name", description: 'Test 1 description',  id: "1" , task_id: "1"  }
    }
  end
end
