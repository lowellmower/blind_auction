module ItemsHelper

  def valid_date(item)
    if Date::today.strftime("%Y-%m-%d") < item.end_date.to_s
      return item
    end
  end

end
