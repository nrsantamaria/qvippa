require "spec_helper"


describe Qvipp do

### RELATIONSHIPS
  it { should have_many(:users) }
  it { should have_many(:feeds) }
  it { should have_many(:users).through(:feeds) }

  it ("has many users") do
    qvipp1 = Qvipp.create({:haiku => "i do dis"})
    user1 = User.create({:name => 'jim', :email => 'jim@email.com', :qvipp_ids => [qvipp1.id]})
    user2 = User.create({:name => 'jillian', :email => 'jillian@email.com', :qvipp_ids => [qvipp1.id]})
    expect(qvipp1.users()).to(eq([user1, user2]))
  end
################

  it ("the callback downcases the haiku after saving") do
    qvipp1 = Qvipp.create({:haiku => "I's da BEST"})
    expect(qvipp1.haiku).to(eq("i's da best"))
  end

  

end
