require "test_helper"
class JournalsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @journal = Journal.create(name: "Test name", description: "Test description")
  end

  test "Should go to journals_new_path" do
    assert_routing({ method: 'get', path: journals_new_path}, { controller: 'journals', action: 'new' })
  end

  test "Should create new journal" do
    post journals_new_path params: { 
      journal: { name: "Test 1 name", description: 'Test 1 description', user_id: 1 }
    }
    assert_response :redirect
  end

  test "Should check if have a route create and create method" do
    assert_routing({ method: 'post', path: journals_new_path}, { controller: 'journals', action: 'create' })
  end

  test "Should go to journals_edit_path" do
    assert_routing({ method: 'get', path: journals_edit_path(1)}, { controller: 'journals', action: 'edit', id: "1" })
  end

  test "Should update journal" do
    patch journals_edit_path(1), params: { journal: { name: "Updated Test Name", description: "Updated Test Description", user_id: 1, id: "1" } }
  end
  
  test "Should check if have a route delete and delete method" do
    assert_routing({ method: 'delete', path: journals_delete_path(1)}, { controller: 'journals', action: 'delete',  id: "1"  })
  end

  test "Should delete journal" do
    delete journals_delete_path(1), params: { 
      journal: { name: "Test 1 name", description: 'Test 1 description', user_id: 1, id: "1" }
    }
  end
end
