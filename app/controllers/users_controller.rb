get "/users/new" do
  erb :'users/new'
end

post "/users" do
  user = User.new(params[:user])
  if user.save
    sessions[:user_id] = user.id
    redirect to("/items")
  else
    @message = "either your username is taken or your password wasn't at least 6 characters long."
    erb :'users/new'
  end
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  @items = Item.where(user_id: @user.id)
  @items_user_has_bid_on = @user.biditems.uniq
  @items_won_by_user = list_of_winning_items(@items_user_has_bid_on, @user)
  erb :'/users/show'
end

