require "sinatra"
require "sinatra/reloader"
require 'sinatra/activerecord'
require "./lib/user"
require "./lib/qvipp"
require "pry"
require 'pg'

also_reload "lib/**/*.rb"

get "/" do
  @all_users = User.all
  erb :index
end

#THE USER PATH

get "/user/:id" do
  @user = User.find_by(id: params['id'].to_i)
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
  haiku = params['new_qvipp']
  if haiku.word_count3?
    current_user.qvipps.create(haiku: haiku)
  else
    current_user.qvipps.create(haiku: "ERROR!")
  end
  redirect "/user/#{user_id}"
end
