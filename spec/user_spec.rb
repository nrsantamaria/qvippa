require "spec_helper"

describe User do

### RELATIONSHIPS
  it { should have_many(:qvipps) }
  it { should have_many(:feeds) }
  it { should have_many(:qvipps).through(:feeds) }

  it ("has many qvipps") do
    user1 = User.create({:name => 'jim', :email => 'jim@email.com'})
    qvipp1 = Qvipp.create({:haiku => "i do dis", :user_ids => [user1.id]})
    qvipp2 = Qvipp.create({:haiku => "i am dis", :user_ids => [user1.id]})
    expect(user1.qvipps()).to(eq([qvipp1, qvipp2]))
  end
################

#### VALIDATION
  it ("checks for true email using @ char") do
    user1 = User.new({:name => 'jim', :email => 'jimmmyboy'})
    user1.save()
    expect(user1.errors.any?).to(eq(true))
  end

  it ("checks for true email using @ char") do
    user1 = User.new({:name => 'jim', :email => 'jimmm@syboy'})
    user1.save()
    expect(user1.errors.any?).to(eq(false))
  end

  it ("checks for true email using @ char") do
    user1 = User.new({:name => 'jim', :email => 'jimmyboy'})
    user1.save()
    expect(user1.errors.to_hash[:email][0]).to(eq("That's no email foo!"))
  end
#################

end
