include Todos

 describe Todos do

  it "'todos should return a 200'" do
    response = Todos.all_todos
    expect(response.code).to be(200)
    expect(response).to be_a_kind_of(String)
  end

  it "should show id" do
    response = Todos.specific_todos(11934)
    expect(response.code).to be(200)
  end 

  it "should create post todo" do
  	todo = {title: 'Lucy & Joe', due: '7-3-2017'}
  	response = Todos.new_todos(todo)
    expect(response.code).to be(201)
  end

  # it 'should convert to JSON' do
  # 	todos = Todos.all_todos
  # 	response = JSON.parse(Todos.all_todos)
  # 	expect(response).to include_json(id: '11934', title: 'Remember the milk')
  # end

  it "should delete todo" do
    todo = {title: 'Lucy & Joe', due: '7-3-2017'}
    response = Todos.new_todos(todo)
    bash = Todos.delete(response["id"])
    expect(Todos.specific_todos(response["id"]).code).to be(404)
  end

  it "should not create a post with due date before the current date" do
    todo = {title: 'Lucy & Joe', due: '2-3-2017'}
    response = Todos.new_todos(todo)
    expect(response.code).to be(405)
  end

  it "should only accept dates for due" do
    todo = {title: 'Lucy & Joe', due: 'asdfk'}
    response = Todos.new_todos(todo)
    expect(response.code).to be(405)
  end

  it "should not create a post with due date before the 1970" do
    todo = {title: 'Lucy & Joe', due: '2-3-1969'}
    response = Todos.new_todos(todo)
    expect(response.code).to be(201)
  end
end