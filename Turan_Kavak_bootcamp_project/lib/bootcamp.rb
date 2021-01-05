class Bootcamp
#######
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
    end
#######
    def name
    @name
    end
    def slogan
    @slogan
    end
    def teachers
    @teachers
    end
    def students
    @students
    end
#######
    def hire(string)
    @teachers << string
    end
    def enroll(string)
     if @student_capacity > @students.length
        @students << string
        true
     else
        false
     end
    end
    def enrolled?(string)
        if @students.include?(string)
            true
        else
            false
        end
    end
    def student_to_teacher_ratio
        @students.length/@teachers.length
    end
    def add_grade(student, *grade)
       if @students.include?(student)
        @grades[student] += grade
        true
       else
        false
       end
    end  #@grades = Hash.new { |hash, key| hash[key] = [] }
    
    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if @grades[student].length == 0 || !(@students.include?(student))
            return nil
        end
        @grades[student].sum/@grades[student].length
    end
end
