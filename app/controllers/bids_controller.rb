post "/bids" do
  if logged_in?
    bid = Bid.create(params[:bid])
    @item = Item.find_by(id: params[:bid][:item_id])
    item_bids = Bid.where(item_id: @item.id)
    @bid_count = item_bids.distinct.count(:user_id)
    @message = "Thanks for you bid and good luck!"
    erb :'items/show'
  else
    redirect to("/login")
  end
end

