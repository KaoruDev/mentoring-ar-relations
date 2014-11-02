require "rails_helper"
##I will be working at this more tonight (10/31). The SpecHelper seed thing took me a day (or 4) to figure out.
##after I commented it out I remembered that we
##did the same when we met.
##I feel like I had a bit of a breakthrough last nigt, but
##I wasn't able to get very far. I was working(job)until
##1 or so.
describe "Querying" do
  #before do
  #  SpecHelper.seed_db
  #end
##commented this out because it seemed to be reseeding db
  it "has many posts" do
    User.first.posts
  end

  it "has many likes" do
    User.first.likes
  end

  it "has many comments" do
    User.first.comments
  end

  it "returns all of the likes that are a user with email domenick.spinka@gmail.com post" do
    result = User.find_by(email: 'domenick.spinka@gmail.com').likes.map { |like| like }
    ##this totally works in the console### grrrrr  error: undefined method `id' for 2:Fixnum
    #i googled the error, but i don't understand tests pass if i comment out spec_helper seed

    ###################
    # DO NOT CODE BELOW THIS
    ##################
    answers = [2, 16, 3, 13, 19, 7, 12, 4, 11, 20, 5, 8, 21]

    result.each do |like|
      expect(answers.delete(like.id)).to be_truthy
    end

    expect(answers.empty?).to eq(true)
  end

  it "returns all of the posts alice@gmail.com commented on" do
    result = User.find_by(email: 'alice@gmail.com').comments.map { |comment| comment.post_id}
     ##this totally works in the console### grrrrr  error: undefined method `id' for 1:Fixnum
     #i googled the error, but i don't understand tests pass if i comment out spec_helper seed
    ###################
    # DO NOT CODE BELOW THIS
    ##################
    answers = [1, 3, 2, 4, 6]

    result.each do |post|
      expect(answers.delete(post.id)).to be_truthy
    end

    expect(answers.empty?).to eq(true)
  end

  xit "returns all of the users who commented on dorian.breitenberg@gmail.com's posts" do
    result = User.find_by(email: 'dorian.breitenberg@gmail.com')
    ###?

    ###################
    # DO NOT CODE BELOW THIS
    ##################
    answers = [2, 4]

    result.each do |user|
      expect(answers.delete(user.id)).to be_truthy
    end

    expect(answers.empty?).to eq(true)
  end

  xit "returns posts with more than 2 likes" do
    result = "your query"

    ###################
    # DO NOT CODE BELOW THIS
    ##################

    answers = [9, 8]

    result.each do |post|
      expect(answers.delete(post.id)).to be_truthy
    end

    expect(answers.empty?).to eq(true)
  end

  xit "create a like on any one of edd@gmail.com's post by alice@gmail.com" do

    ###################
    # DO NOT CODE BELOW THIS
    ##################
    alice = User.find_by(email: "alice@gmail.com")

    answer = User.find_by(email: "edd@gmail.com").posts.select do |post|
      post.likes.where(user_id: alice.id).first
    end

    expect(answer.empty?).to be_falsey
  end

  xit "Return a post commented by domenick.spinka@gmail.com and liked by dorian.breitenberg@gmail.com" do
    # Your query goes here. You can assign variable etc until you find the post you need.
    result = "your query"

    ###################
    # DO NOT CODE BELOW THIS
    ##################

    expect(result.id).to equal(6)

  end

end
