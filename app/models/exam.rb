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

  attr_accessor :filels

  def total
    self.english + self.hindi + self.mathematics + self.science + self.social
  end

  def stats(subject_name)

    @stats ||= {}
    # cache assignment
    return @stats[subject_name] if @stats[subject_name]
    #reducing cached queries using @var

    my_score = self.send(subject_name)
    students = self.student.section.students.includes(:exam)
    scores = students.collect do |st|
      st.exam.send(subject_name)
    end

    high = scores.max
    avg = ((scores.inject(:+).to_f)/students.count).round(2)

    below_count = scores.count do |score|
      score <= my_score
    end
    percentile = 100*below_count/students.count
    rank = students.count - below_count + 1

    @stats[subject_name] = {high: high, avg: avg, percentile: percentile, rank: rank}

    return @stats
  end

  # def high(subject_name)
  #   self.student.section.students.includes(:exam).collect do |st|
  #     st.exam.send(subject_name)
  #   end.max
  # end
  #
  # def avg(subject_name)
  #   arr = self.student.section.students.collect do |st|
  #           st.exam.send(subject_name)
  #         end
  #   avg = ((arr.inject(:+).to_f)/arr.length).round(2)
  #   return avg
  # end
  #
  # def percentile(subject_name)
  #   arr = self.student.section.students.collect do |st|
  #           st.exam.send(subject_name)
  #         end
  #   marks = self.send(subject_name)
  #   puts ("q")
  #   arr.sort!
  #   x = arr.index(marks)
  #   n = arr.length
  #
  #   percentile = ((x.to_f/(n-1))*100).round(2)
  #
  # end
  #
  # def rank(subject_name)
  #   score = self.send(subject_name)
  #   students = self.student.section.students
  #
  #   below_count = students.collect do |st|
  #     st.exam.send(subject_name)
  #   end.count do |sc|
  #     sc <= score
  #   end
  #
  #   return students.count - below_count + 1
  #
  # end
end
