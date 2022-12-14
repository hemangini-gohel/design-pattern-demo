# combine tasks in set of modules and perform them

class Task
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    @sub_tasks.inject(0.0) { |time, task| time += task.get_time_required }
  end
end

class AddDryIngredientsTask < CompositeTask
  def initialize
    super("Add dry ingredients")
  end

  def get_time_required
    1.0
  end
end

class AddLiquidsTask < CompositeTask
  def initialize
    super("Add liqiud ingredients")
  end

  def get_time_required
    1.0
  end
end

class MixTask < CompositeTask
  def initialize
    super("Mix Ingrediants")
  end

  def get_time_required
    1.0
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super("Make batter")
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(AddLiquidsTask.new)
    add_sub_task(MixTask.new)
  end
end

class FillPanTask < CompositeTask
  def initialize
    super("Fill Pan")
  end

  def get_time_required
    1.0
  end
end

class BakeTask < CompositeTask
  def initialize
    super("Bake cake")
  end

  def get_time_required
    1.0
  end
end

class LickSpoonTask < CompositeTask
  def initialize
    super("Lick spoon")
  end

  def get_time_required
    1.0
  end
end

class MakeCakeTask < CompositeTask
  def initialize
    super("Make cake")
    add_sub_task(MakeBatterTask.new)
    add_sub_task(FillPanTask.new)
    add_sub_task(BakeTask.new)
    add_sub_task(LickSpoonTask.new)
  end
end

puts "*** Time required to prepare cake ***"
puts MakeCakeTask.new.get_time_required
