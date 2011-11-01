require "spec_helper"
require "cancan/matchers"

describe Ability do
  let(:category)    { Factory.build :category }
  let(:product)     { Factory.build :product, :category => category }
  let(:old_product) { product.tap { |p| p.new_arrival = false } }
  let(:new_product) { product.tap { |p| p.new_arrival = true } }

  {
    :guest => nil,
    :regular_user => Factory(:user, :admin => false, :premium => false)
  }.each do |k, v|
    describe "as #{k}" do
      subject { Ability.new(v) }

      it { should be_able_to :access, :pages }
      it { should be_able_to :read,   old_product }
      it { should be_able_to :read,   :categories }

      it { should_not be_able_to :read,    new_product }
      it { should_not be_able_to :create,  :products }
      it { should_not be_able_to :update,  :products }
      it { should_not be_able_to :destroy, :products }
      it { should_not be_able_to :create,  :categories }
      it { should_not be_able_to :update,  :categories }
      it { should_not be_able_to :destroy, :categories }
    end
  end

  describe "as premium user" do
    subject { Ability.new(Factory :user, :admin => false, :premium => true) }

    it { should be_able_to :access, :pages }
    it { should be_able_to :read,   old_product }
    it { should be_able_to :read,   new_product }
    it { should be_able_to :read,   :categories }

    it { should_not be_able_to :create,  :products }
    it { should_not be_able_to :update,  :products }
    it { should_not be_able_to :destroy, :products }
    it { should_not be_able_to :create,  :categories }
    it { should_not be_able_to :update,  :categories }
    it { should_not be_able_to :destroy, :categories }
  end

  describe "as admin" do
    subject { Ability.new(Factory :user, :admin => true) }

    it { should be_able_to :access, :all }
  end
end
