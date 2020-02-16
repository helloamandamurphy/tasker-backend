DATA = {
  :user_keys => ["name", "email", "password"],
  :users => [
    ["Jessica Jones", "jjones@aliasinvestigations.com", "1234"],
    ["Thor Odinson", "thor@asgard.net", "1234"],
    ["Steve Rogers", "firstavenger@avengers.com", "1234"]
  ],

  :list_keys => ["user_id", "name", "start_time", "end_time"],
  :lists => [
    [1, "Jonesin", Time.now, Time.now],
    [2, "Day in the Life of a Norse God", Time.now, Time.now],
    [3, "Last Day as Cap", Time.now, Time.now]
  ],

  :task_keys => ["list_id", "name", "est_time"],
  :tasks => [
    [1, "Creep on Luke Cage", 15],
    [1, "Drink", 120],
    [1, "Photograph philanderer", 60],

    [2, "Drink coffee", 10],
    [2, "Hang out with Baby Groot", 60],
    [2, "Play Overwatch with Rabbit", 180],

    [3, "Shave", 10],
    [3, "Time Travel", 45],
    [3, "Dance with Peggy", 180]
  ],
}

def main
  make_users
  make_lists
  make_tasks
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attr, i|
      new_user.send(DATA[:user_keys][i]+"=", attr)
    end
    new_user.save
  end
end

def make_lists
  DATA[:lists].each do |list|
    new_list = List.new
    list.each_with_index do |attr, i|
      new_list.send(DATA[:list_keys][i]+"=", attr)
    end
    new_list.save
  end
end

def make_tasks
  DATA[:tasks].each do |task|
    new_task = Task.new
    task.each_with_index do |attr, i|
      new_task.send(DATA[:task_keys][i]+"=", attr)
    end
    new_task.save
  end
end

main
