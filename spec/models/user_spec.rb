require 'rails_helper'

describe User do
  let(:user1){create_user}
  let(:user2){create_user}
  let(:memorial){create_memorial}

  it "should know when they are an admin" do
    Administrator.create(memorial_id: memorial.id, user_id: user1.id)

    expect(user2.is_administrator?(memorial)).to eq(false)
    expect(user1.is_administrator?(memorial)).to eq(true)
  end
end