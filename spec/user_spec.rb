require "spec_helper"

describe User do

  it { should have_many(:qvipps) }
  it { should have_many(:feeds) }
  it { should have_many(:qvipps).through(:feeds) }

  it ("has many qvipps") do
    user1 = User.create({:name => 'jim', :email => 'jim@email.com'})
    qvipp1 = Qvipp.create({:haiku => "i do dis", :user_ids => [user1.id]})
    qvipp2 = Qvipp.create({:haiku => "i am dis", :user_ids => [user1.id]})
    expect(user1.qvipps()).to(eq([qvipp1, qvipp2]))
  end

end

# RSpec.describe User, type: :model do
#   it { should have_many(:qvipps) }
#   it { should have_many(:feeds) }
# end
