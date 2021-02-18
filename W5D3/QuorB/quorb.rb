require 'singleton'
require 'sqlite3'


class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('quorb.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end


class User

    attr_accessor :id, :fname, :lname

    def self.find_by_id(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless user.length > 0
        User.new(user.first)
    end


#{'id' => 1, 'fname' => 'Ben, 'lname' => 'Young'}
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end



end

