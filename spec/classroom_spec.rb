require 'rspec'
require './lib/classroom'

describe Classroom do
  context 'Attributes' do
    it 'is a classroom' do
      classroom = Classroom.new('History', 4)
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'has a subject' do
      classroom = Classroom.new('History', 4)
      expect(classroom.subject).to eq('History')
    end

    it 'has a capacity' do
      classroom = Classroom.new('History', 4)
      expect(classroom.capacity).to eq 4
    end

    it 'has no students by default' do
      classroom = Classroom.new('History', 4)
      expect(classroom.students).to eq []
    end
  end

  # Iteration 2

  context 'Students' do
    it 'returns a list of students' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Ian')

      expect(classroom.students).to eq ['Mike', 'Megan', 'Ian']
    end

    it 'returns a list of uppercased names' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Ian')

      expect(classroom.yell_at_students).to eq ['MIKE', 'MEGAN', 'IAN']
    end
  end

  # Iteration 3

  context 'Capacity' do
    it 'returns false if classroom is not #over_capacity?' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')

      expect(classroom.over_capacity?).to eq(false)
    end

    it 'returns true if classroom is #over_capacity?' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')
      classroom.add_student('Eve')
      classroom.add_student('Alice')

      expect(classroom.over_capacity?).to eq(true)
    end
  end

  # Iteration 4

  context 'Capacity' do
    it 'can #kick_out student' do
      classroom = Classroom.new('History', 4)
      classroom.add_student('Mike')
      classroom.add_student('Megan')
      classroom.add_student('Bob')
      classroom.add_student('James')
      classroom.add_student('Cat')
      classroom.add_student('Alice')

      classroom.kick_out

      expect(classroom.over_capacity?).to eq(true)

      classroom.kick_out

      expect(classroom.over_capacity?).to eq(false)
      expect(classroom.students).to eq(['Bob', 'James', 'Cat', 'Alice'])
    end
  end
end
