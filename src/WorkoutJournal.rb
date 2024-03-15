class WorkoutJournal
  attr_accessor :workouts

  def initialize
    @workouts = []
  end

  def log_workout(date, type, duration, intensity)
    @workouts << { date: date, type: type, duration: duration, intensity: intensity }
  end

  def list_workouts
    @workouts.each_with_index do |workout, index|
      puts "#{index + 1}: On #{workout[:date]}, #{workout[:type]} for #{workout[:duration]} minutes at #{workout[:intensity]} intensity."
    end
  end

  def delete_workout(index)
    raise IndexError, 'Workout not found' unless index.between?(1, @workouts.length)
    @workouts.delete_at(index - 1)
  end

  def find_workouts_by_date(date)
    @workouts.select { |workout| workout[:date] == date }
  end

  def update_workout(index, details)
    @workouts[index - 1] = details
  end
end
