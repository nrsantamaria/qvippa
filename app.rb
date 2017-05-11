require "sinatra"
require "sinatra/reloader"
require 'sinatra/activerecord'
require "./lib/user"
require "./lib/feed"
require "./lib/qvipp"
require "pry"
require 'pg'

also_reload "lib/**/*.rb"

# Department.all.each do |d|
#   d.destroy
# end

get "/" do
  @all_users = User.all
  erb :index
end

#THE USER PATH

get "/user/:id" do
  @user = User.find_by(id: params['id'].to_i)
  @all_users = User.all
  erb :user
end

post "/user/new_sign_up" do
  username = params['user_name']
  useremail = params['user_email']
  new_user = User.create(name: username, email: useremail)
  redirect "/"
end

get "/user/settings/:id" do
  @found_user = User.find_by(id: params['id'].to_i)
  erb :user_settings
end

patch "/user/edit/:id" do
  user_id = params['id'].to_i
  user_name = params['edit_name']
  user_email = params['edit_email']
  @found_user = User.find_by(id: params['id'].to_i)
  @found_user.update(name: user_name, email: user_email)
  redirect "/user/settings/#{user_id}"
end

delete "/user/delete/:id" do
  user_id = params['id'].to_i
  @found_user = User.find_by(id: params['id'].to_i)
  @found_user.delete
  redirect "/"
end

post "/user/new_qvipp/:id" do
  user_id = params['id'].to_i
  current_user = User.find_by(id: user_id)
  haiku = params.fetch('new_qvipp')
  @qvipp = Qvipp.new({:haiku => haiku, :original_user => current_user.name, :user_ids => [current_user.id]})
  if @qvipp.save()
    redirect("/user/#{user_id}")
  else
    erb(:errors)
  end
end

delete("/user/:user_id/delete_qvipp/:qvipp_id") do
  user_id = params.fetch('user_id').to_i
  qvipp_id = params.fetch('qvipp_id').to_i
  found_qvipp = Qvipp.find_by(id: qvipp_id)
  found_qvipp.delete
  redirect("/user/#{user_id}")
end

post("/user/:user_id/copy_qvipp/:qvipp_id") do
  user_id = params.fetch('user_id').to_i
  current_user = User.find_by(id: user_id)
  qvipp_id = params.fetch('qvipp_id').to_i
  found_qvipp = Qvipp.find_by(id: qvipp_id)
# binding.pry
  new_feed = Feed.create({:qvipp_id => qvipp_id, :user_id => user_id})
  new_feed.save()
  redirect("/user/#{user_id}")
end
