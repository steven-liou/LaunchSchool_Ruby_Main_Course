=begin

Input :

Output :

Rules
  - Add a student's name to the roster for a grade
  - Get list of all students enrolled in a grade
  - Get a sorted list of all students in all grades
    - grade should short by ascending order, 1, 2, 3...

Data structure / Algorithms
  Hash with grade as key, and an array of students' names as values
  When adding a student, requires that the first argument is his name, and second argument is his grade

=end

class School
  def initialize
    @roster = Hash.new([])
  end

  def add(name, _grade)
    @roster[grade] += [name]

  end

  def grade(grade)
    @roster[grade]
  end

  def to_h
    @roster.sort.each_with_object({}) do |(grade, students), obj|
      obj[grade] = students.sort
    end
  end
end