class YearEvent
  attr_accessor :name
  def initialize(name = "empty")
    @name = name
  end
  def to_s
    "data: " + @name
  end
end

class MonthEvent < YearEvent
  attr_accessor :date
  attr_accessor :importance

  def initialize(name = "empty", date = "no date", importance = "no importance")
    super(name)
    @name = name
    @date = date
    @importance = importance
  end

  def to_s
    " name: " + @name + " date: " + date + " importance: " + importance
  end
end

class WeekEvent < MonthEvent
  attr_accessor :reminders
  def initialize(name = "empty", date = "no date", importance = "no importance", reminders = "no reminders")
    super(name, date, importance)
    @reminders = reminders
  end
  def to_s
    "name: " + @name + "phone: " + date + " email: " + importance + " messenger: " + reminders
  end
end

class EventArray
  attr_accessor :array
  def initialize(array = "array_1")
    @array = array
  end

  def add(obj)
    @array.append obj
  end

  def findByImportance(importance)
    @array.select do |i|
      i.importance.start_with? importance
    end
  end

  def sortByData
    @array.sort do |a , b|
      a.data > b.data
    end
  end

  def to_s
    array.each do |item|
      puts item
    end
  end
end


