module ApplicationHelper
  def declension count
    if ((11..14).include? count % 100) ||
      ((5..9).include? count % 10) ||
      (count % 10 == 0)
      "third"
    elsif count % 10 == 1
      "first"
    else
      "second"
    end
  end

  def separator item
    item.digits(1000).reverse.join(",")
  end
end
