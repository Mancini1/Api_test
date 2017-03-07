require 'rest-client'
require 'json'

module Todos

  def self.all_todos
    begin
      return RestClient.get 'http://lacedeamon.spartaglobal.com/todos'
    rescue => e
      return e.response
    end
  end

  def self.specific_todos(id)
    begin
      return RestClient.get 'http://lacedeamon.spartaglobal.com/todos/' + id.to_s
    rescue => e
      return e.response
    end
  end

  def self.new_todos(hash)
    begin
      return RestClient.post 'http://lacedeamon.spartaglobal.com/todos', hash
    rescue => e
      return e.response
    end
  end

  def self.delete(bash)
    begin
      return RestClient.delete 'http://lacedeamon.spartaglobal.com/todos/' + bash.to_s
    rescue => e
      return e.response
    end
  end




  # def delete_todos(id, token)
  #   begin
  #     return RestClient.delete 'http://lacedeamon.spartaglobal.com/todos' + id.to_s, :cookie => 'token=' + token
  #   rescue => e
  #     return e.response
  #   end
  # end

  # [{
  #   id: 11934,
  #   title: 'Remember the milk',
  #   due: '2016-11-25',
  #   created_at:'2016-11-25T16:33:11.156Z'
  #   updated_at:'2016-11-25T16:33'
  #   }]

end