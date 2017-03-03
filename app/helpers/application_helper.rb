module ApplicationHelper

  def into_dollars(cents_integer)
    '$' + ("%.2f" % (cents_integer / 100))
  end

end
