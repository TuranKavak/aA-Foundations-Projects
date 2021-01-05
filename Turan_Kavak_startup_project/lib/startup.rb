require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end
    def > (other_startup)
        if self.funding > other_startup.funding
            return true
        else
            return false
        end
    end
    def hire (employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        @employees.length
    end
    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "Funding is not sufficient"
        end
    end
    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salary = 0
        @employees.each { |employee| total_salary += @salaries[employee.title] }
        total_salary/@employees.length
    end
    def close
        @employees = []
        @funding = 0
    end
    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        other_startup.employees.each { |employee| @employees << employee }

        other_startup.close
    end

    
end
