# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  student_id  :integer
#  english     :integer
#  hindi       :integer
#  mathematics :integer
#  science     :integer
#  social      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Exam < ActiveRecord::Base
  belongs_to :student

  attr_accessor :file

  def high(subject_name)
    self.student.section.students.collect do |st|
      st.exam.send(subject_name)
    end.max
  end

  def avg(subject_name)
    arr = self.student.section.students.collect do |st|
            st.exam.send(subject_name)
          end
    avg = ((arr.inject(:+).to_f)/arr.length).round(2)
    return avg
  end

  def percentile(subject_name)
    arr = self.student.section.students.collect do |st|
            st.exam.send(subject_name)
          end
    marks = self.send(subject_name)
    puts ("q")
    arr.sort!
    x = arr.index(marks)
    n = arr.length

    percentile = ((x.to_f/(n-1))*100).round(2)

  end
end
