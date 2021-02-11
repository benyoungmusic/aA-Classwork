class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = (@salary) * multiplier
    end

end

class Manager < Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss=nil, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        (@employees.inject(0) {|acc, el| acc + el.salary}) * multiplier
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil, [darren, shawna, david])
darren = Manager.new("Darren", "TA Manager", 78000, nil, [shawna, david])
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, nil)
# p shawna.salary
# p darren.salary
p david.bonus(3) # => 30_000
p darren.bonus(4) # => 88_000
p ned.bonus(5) # => 500_000