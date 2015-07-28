get "/items" do
  @items = Item.where("start < ? AND stop > ?", Date.today, Date.today)
  erb :'items/index'
end

get "/items/new" do
  if logged_in?
    @user = User.find_by(id: params[:user_id])
    erb :'items/new'
  else
    redirect to("/")
  end
end

post "/items" do
  if logged_in?
    item = Item.new(params[:item])
    if item.save
      redirect to("/users/#{params[:item][:user_id]}")
    else
      redirect back
    end
  else
    redirect to("/login")
  end
end

get "/items/:id" do
  @item = Item.find_by(id: params[:id])
  item_bids = Bid.where(item_id: params[:id])
  @bid_count = item_bids.distinct.count(:user_id)
  erb :'items/show'
end

get "/items/:id/edit" do
  @item = Item.find_by(id: params[:id])
  if user_created_item?(@item)
    erb :'items/edit'
  else
    redirect back
  end

end

put "/items/:id" do
  @item = Item.find_by(id: params[:id])
  @item.assign_attributes(params[:item])
  if @item.save
    redirect to("/users/#{session[:user_id]}")
  else
    redirect back
  end
end

delete "/items/:id" do
  Item.find_by(id: params[:id]).destroy
  redirect to("/users/#{session[:user_id]}")
end