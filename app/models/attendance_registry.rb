# == Schema Information
#
# Table name: attendance_registries
#
#  id         :integer          not null, primary key
#  date       :date
#  section_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AttendanceRegistry < ActiveRecord::Base
  belongs_to :section

  has_many :absentees, dependent: :destroy

  after_create :create_absentees
  after_update :update_absentees
  # callback actions

  # attr_accessor :absentee_ids
  # # absentee_ids is not available in AttendanceRegistry table but is need to store absent student id's so used attr_accessor

  attr_accessor :absent_student_ids
  # as absentee_ids is a col of a absentee table so v hav renamed it as absent_student_ids

private
   def create_absentees
     self.absent_student_ids.each do |student_id|
       self.absentees.create(student_id: student_id)
     end
   end

   def update_absentees
    # Remove old absentees who are present now
    self.absentees.reject do |absentee|
      self.absent_student_ids.include?(absentee.student_id)
    end.each do |absentee|
        absentee.destroy
      end
    # Add new absentees
    self.absent_student_ids.each do |student_id|
      self.absentees.find_or_create_by(student_id: student_id)
    end
   end


end
