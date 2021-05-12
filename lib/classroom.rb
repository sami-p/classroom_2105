class Classroom
  attr_reader :subject,
              :capacity

  def initialize(subject, capacity)
    @subject = subject
    @capacity = capacity
  end
end
