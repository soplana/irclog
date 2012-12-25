class Log 
  include Mongoid::Document
  
  field :name
  field :text
  field :time

  def self.one_day day
    where(time: /#{day}/).asc(:time)
  end
end
