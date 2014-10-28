require 'rails_helper'

describe MemorialsController do
  let!(:user){ create_user }

  before :each do
    session[:user_id] = user.id
  end

  describe "POST create" do
    it "should assign the creating user as administrator" do
      expect(Administrator.all.count).to eq(0)

      post :create, {memorial: {name: "Abe Lincoln", born: "10/01/2014", died: "10/05/2014"}}

      expect(Administrator.all.count).to eq(1)
      expect(Administrator.first.id).to eq(user.id)
    end

    it "should create a membership for the user" do
      expect(Membership.all.count).to eq(0)

      post :create, {memorial: {name: "Abe Lincoln", born: "10/01/2014", died: "10/05/2014"}}

      expect(Membership.all.count).to eq(1)
      expect(Membership.first.id).to eq(user.id)
    end
  end



end