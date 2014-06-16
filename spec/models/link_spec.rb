require 'rails_helper'

describe Link do
  before do
    @link = Link.new url: "google.com", custom: "goo.gl"
  end

  subject { @link }

  it { should respond_to(:url) }
  it { should respond_to(:custom) }
  it { should respond_to(:hits) }
  it { should respond_to(:last_hit_at) }

  it { should be_valid }

  describe "when url is not present" do
    before { @link.url = " " }
    it { should_not be_valid }
  end

  describe "when custom is not present" do
    before { @link.custom = " " }
    it { should be_valid }
  end

  describe "when custom is not present" do
    before do
      @link.custom = ""
      @link.save
    end
    it "should be generated" do
      expect(@link.custom).to_not be_blank
    end
  end

  describe "when url is too short" do
    before { @link.url = "a" }
    it { should_not be_valid }
  end

  describe "when url is too long" do
    before { @link.url = "a"*151 }
    it { should_not be_valid }
  end

  describe "when custom is too long" do
    before { @link.custom = "a"*51 }
    it { should_not be_valid }
  end

  describe "when just created" do
    before { @link.save }

    it "has zero hits" do
      expect(@link.hits).to eq(0)
      expect(@link.last_hit_at).to eq(nil)
    end
  end

  describe "when custom is already taken" do
    before do
      dup = @link.dup
      dup.custom.upcase!
      dup.save
    end

    it { should_not be_valid }
  end
end
