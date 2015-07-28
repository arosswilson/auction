helpers do

  def list_of_winning_items(array_of_items, user)
    items_won = []
    array_of_items.each do |item|
      if item.stop < Date.today
        item.winning_bidder_id = item.bids.order(:amount).last.user_id
        if item.winning_bidder_id == user.id
          items_won << item
        end
      end
    end
    return items_won
  end

end