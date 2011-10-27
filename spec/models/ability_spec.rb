require "spec_helper"
require "cancan/matchers"

describe Ability do
  describe "as guest" do
    subject { Ability.new(nil) }

    it { should be_able_to :access, :pages }
    it { should be_able_to :read,   :products }
    it { should be_able_to :read,   :categories }

    it { should_not be_able_to :access, :products }
    it { should_not be_able_to :access, :categories }
  end

  describe "as regular user" do
    subject { Ability.new(Factory :user, :admin => false) }

    it { should be_able_to :access, :pages }
    it { should be_able_to :read,   :products }
    it { should be_able_to :read,   :categories }

    it { should_not be_able_to :access, :products }
    it { should_not be_able_to :access, :categories }
  end

  describe "as admin" do
    subject { Ability.new(Factory :user, :admin => true) }

    it { should be_able_to :access, :all }
  end
end
