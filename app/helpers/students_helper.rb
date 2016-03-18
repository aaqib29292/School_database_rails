module StudentsHelper
  COLOR_TO_CLASS = {
    "Yellow" => "warning",
    "Red" => "danger",
    "Blue" => "primary",
    "Green" => "success",
  }


  def student_house_label_class(student)
    house_name = student.house.name

    return COLOR_TO_CLASS[house_name]
  end

  # Sample argument:
  #   {"Yellow": 3, "Red": 4, "Blue": 6, "Green": 7}

  def house_counts_tag(hsh)
    str = ""
    hsh.each do |house_name, house_count|
      str += content_tag(:span, house_count, class: "pull-right label label-#{COLOR_TO_CLASS[house_name]}")
    end

    raw(str)
  end
end
