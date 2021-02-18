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

    def self.find_by_full_name(fname, lname)
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

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

#{'id' => 1, 'fname' => 'Ben, 'lname' => 'Young'}
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end


class Question
    attr_accessor :body, :title, :user_id
    attr_reader :id

        def self.find_by_title(title)
        question = QuestionsDatabase.instance.execute(<<-SQL, title)
            SELECT
                *
            FROM
                questions
            WHERE
                title = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @title = options['title']
        @user_id = options['user_id']
    end


end

class Question_follow
    attr_accessor :user_id, :question_id
    attr_reader :id

    def self.find_by_question(question_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                question_follows
            JOIN
                question_follows ON question_follows.question_id = questions.id
            WHERE
                question_id = ?
        SQL
        return nil unless question_follow.length > 0
        Question_follow.new(question_follow.first)
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| Question_follow.new(datum) }
    end




    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

end
