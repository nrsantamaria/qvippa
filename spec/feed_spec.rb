require "spec_helper"

describe Feed do
  it { should belong_to(:user) }
  it { should belong_to(:qvipp) }

  it ("finds a single row from the FEEDS table") do
    user1 = User.create({:name => 'jim', :email => 'jim@email.com'})
    qvipp1 = Qvipp.create({:haiku => "i do dis", :user_ids => [user1.id]})
    found_feed = Feed.all.find_feed(qvipp1.id, user1.id)
    expect(found_feed[0].qvipp_id).to(eq(qvipp1.id))
  end

end
