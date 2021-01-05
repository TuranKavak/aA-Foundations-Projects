require './list.rb'

class TodoBoard
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, target, *args = gets.chomp.split(' ')

        case cmd
        when 'ls'#print the labels of all lists
            @lists.keys.each { |label| puts ' ' + label }
        when 'showall'#print all lists
            @lists.each_value(&:print)
        when 'mklist'#make a new list with the given label
            @lists[target] = List.new(target)
        when 'mktodo'#add a new item to the specified list with the given information
            @lists[target].add_item(*args)
        when 'toggle'#toggle "done" for the specified item on the given list
            @lists[target].toggle_item(args[0].to_i)
        when 'rm'#remove the specified item on the given list
            @lists[target].remove_item(args[0].to_i)
        when 'purge'#remove all "done" items on the given list
            @lists[target].purge
        when 'up'
            @lists[target].up(*args.map(&:to_i))
        when 'down'
            @lists[target].down(*args.map(&:to_i))
        when 'swap'
            @lists[target].swap(*args.map(&:to_i))
        when 'sort'#sort the given list by deadline
            @lists[target].sort_by_date!
        when 'priority'#print the all information for the item at the top of the given list
            @lists[target].print_priority
        when 'print'
            if args.empty?#print all items of the given list if index is not provided
                @lists[target].print
            else#print the specific item of the given list if index is provided
                @lists[target].print_full_item(args[0].to_i)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while true
            return if !get_command
        end
    end
end

TodoBoard.new.run
