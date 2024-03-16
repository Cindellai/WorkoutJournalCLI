require_relative 'WorkoutJournal'

def main
  tracker = WorkoutJournal.new
  loop do
    puts "Welcome to Workout Journal! Choose an option:"
    puts "1. Log a workout"
    puts "2. View logged workouts"
    puts "3. Delete a workout"
    puts "4. Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Enter the date (YYYY-MM-DD):"
      date = gets.chomp
      puts "Enter the workout type (e.g., Cardio, Strength):"
      type = gets.chomp
      puts "Enter the duration in minutes:"
      duration = gets.chomp
      puts "Enter the intensity (Low, Medium, High):"
      intensity = gets.chomp
      tracker.log_workout(date, type, duration.to_i, intensity) 
      puts "Workout logged successfully!"
    when 2
      tracker.list_workouts
    when 3
      puts "Enter the number of the workout you want to delete:"
      index = gets.chomp.to_i
      begin
        tracker.delete_workout(index)
        puts "Workout deleted."
      rescue IndexError
        puts "Invalid workout number."
      end
    when 4
      puts "Exiting Workout Journal. Keep moving!"
      break
    else
      puts "Invalid option. Please try again."
    end
  end
end

main
