require 'minitest/autorun'
require_relative '../src/WorkoutJournal'


class WorkoutJournalTest < Minitest::Test
  def setup
    @journal = WorkoutJournal.new
    @journal.log_workout("2023-01-01", "Cardio", 30, "High")
  end

  def test_log_workout
    assert_equal 1, @journal.workouts.size
  end

  def test_delete_workout
    @journal.delete_workout(1)
    assert_empty @journal.workouts
  end

  def test_log_multiple_workouts
    @journal.log_workout("2023-01-02", "Strength", 45, "Medium")
    @journal.log_workout("2023-01-03", "Yoga", 60, "Low")
    assert_equal 3, @journal.workouts.size
  end

  def test_workout_details
    workout = @journal.workouts.first
    assert_equal "2023-01-01", workout[:date]
    assert_equal "Cardio", workout[:type]
    assert_equal 30, workout[:duration]
    assert_equal "High", workout[:intensity]
  end

  def test_delete_non_existent_workout
    assert_raises(IndexError) { @journal.delete_workout(999) }
  end

  def test_find_workout_by_date
    found_workouts = @journal.find_workouts_by_date("2023-01-01")
    assert_equal 1, found_workouts.size
    assert_equal "Cardio", found_workouts.first[:type]
  end

  def test_update_workout
    @journal.update_workout(1, date: "2023-01-01", type: "HIIT", duration: 30, intensity: "High")
    updated_workout = @journal.workouts.first
    assert_equal "HIIT", updated_workout[:type]
  end
end
