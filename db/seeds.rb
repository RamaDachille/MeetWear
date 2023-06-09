# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"


def create_pics(url, file_name, post)
  p url
  file = URI.open(url)
  post.photo.attach(io: file, filename: file_name, content_type: "image/png")
  return post
end

images_ask = [
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142297/tumblr_d1f848c440edcf12e8dc4f7efa36226c_a837fedd_1280_wh2oqj.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_de26a18d8068fc32223dbf8232bd2a8a_f281a2af_1280_cxfwpo.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_bd3983c2f635152a637846c0d1fc872b_e697de42_1280_fcbunc.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_af360d1efc0461e4a9638302a4eaaf2d_a24885b0_2048_d7ozx4.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_27e7d396addc8b3b522213a49adaaf57_f8c6ded3_1280_jkikt7.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_b7dd96bd2ac91f1b590b1d2c38b10eca_6b602512_1280_llwgwo.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_0cef66d837ebf5495a02840ba13aa649_961e6628_1280_dgnpx3.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_0cef66d837ebf5495a02840ba13aa649_961e6628_1280_dgnpx3.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_5c7ec8bde86b60577e60faf102f15b5b_bcb546de_1280_nqqjrq.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_5c7ec8bde86b60577e60faf102f15b5b_bcb546de_1280_nqqjrq.jpg"
]

images_share = [
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142297/tumblr_d1f848c440edcf12e8dc4f7efa36226c_a837fedd_1280_wh2oqj.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_de26a18d8068fc32223dbf8232bd2a8a_f281a2af_1280_cxfwpo.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_bd3983c2f635152a637846c0d1fc872b_e697de42_1280_fcbunc.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_21387bcd55ed43af230124b3a2a54b25_e14a5a3b_1280_bkzkna.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_af360d1efc0461e4a9638302a4eaaf2d_a24885b0_2048_d7ozx4.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_27e7d396addc8b3b522213a49adaaf57_f8c6ded3_1280_jkikt7.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_b7dd96bd2ac91f1b590b1d2c38b10eca_6b602512_1280_llwgwo.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_b7dd96bd2ac91f1b590b1d2c38b10eca_6b602512_1280_llwgwo.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_0cef66d837ebf5495a02840ba13aa649_961e6628_1280_dgnpx3.jpg",
  "https://res.cloudinary.com/ddok1v1nf/image/upload/v1686142296/tumblr_5c7ec8bde86b60577e60faf102f15b5b_bcb546de_1280_nqqjrq.jpg"
]

UserFollower.destroy_all
User.destroy_all
SavedPost.destroy_all
Post.destroy_all
Comment.destroy_all
Feedback.destroy_all
Followed.destroy_all
Follower.destroy_all
Like.destroy_all

joanna = User.new(email: "joanna@example.com",
                  password: 123456,
                  first_name: "Joanna",
                  last_name: "Pink",
                  user_name: "joanna_pink")
joanna.save!
joanna = create_pics("https://unsplash.com/photos/CTlRgg7Gfmw", joanna.id, joanna)
joanna.save!

maria = User.new(email: "maria@example.com",
  password: 123456,
  first_name: "Maria",
  last_name: "Green",
  user_name: "mgreen")
maria.save!
maria = create_pics("https://unsplash.com/photos/KIg7V5AbTpw", maria.id, maria)
maria.save!

carolina = User.new(email: "carolina@example.com",
  password: 123456,
  first_name: "Carolina",
  last_name: "Blue",
  user_name: "bluecarolina")
carolina.save!
carolina = create_pics("https://unsplash.com/photos/VfjbH7PlWRk", carolina.id, carolina)
carolina.save!

pics = [
  "https://unsplash.com/photos/K_b41GaWC5Y",
  "https://unsplash.com/photos/ua9bUXzUUpw",
  "https://unsplash.com/photos/46xMMnBk9_Y",
  "https://unsplash.com/photos/1RV6iEAhNVQ",
  "https://unsplash.com/photos/CTlRgg7Gfmw",
  "https://unsplash.com/photos/MBjG3mgBEno",
  "https://unsplash.com/photos/g0pb9aXpbgQ",
  "https://unsplash.com/photos/VfjbH7PlWRk",
  "https://unsplash.com/photos/yuahvgxIXjE",
  "https://unsplash.com/photos/-FFzCxuXQYY",
  "https://unsplash.com/photos/4H2fivgnwRg",
  "https://unsplash.com/photos/HD8KlyWRYYM",
  "https://unsplash.com/photos/fi-32JQhPZg",
  "https://unsplash.com/photos/u3WmDyKGsrY",
  "https://unsplash.com/photos/KIg7V5AbTpw"
]

usernames = [
  "FashionistaQueen",
  "style_guru",
  "TrendsetterChic",
  "fashionobsessed",
  "HauteCoutureDiva",
  "glamourenthusiast",
  "chicAndFabulous",
  "FashionForward",
  "trendyfashionista",
  "CoutureAddict",
  "runway_princess",
  "FashionIconic",
  "StylishSiren",
  "GlamFashionista",
  "chic_vogue",
  "TrendyStyleStar",
  "fashionistaGoddess",
  "StyleMaven",
  "glamourista",
  "FashionistaExtraordinaire",
  "Fashion.Seeker",
  "style_quest",
  "Trend.Explorer",
  "fashion.curious",
  "Outfit_Inquirer",
  "Style_Enthusiast",
  "Fashion_Explorer",
  "Trend.Tracker",
  "Style_Insider",
  "Fashion.Savvy",
  "Wardrobe_Adventurer",
  "Style.Challenger",
  "Fashion_Insight",
  "Trendy.Seeker",
  "Style_Quester",
  "Fashion.Finder",
  "Style_Detective",
  "Trend.Hunter",
  "Fashionista.Inquiry",
  "Style_Journey"
]

10.times do |i|
  user = User.new(email: Faker::Internet.email,
          password: 123456,
          first_name: Faker::Beer.brand,
          last_name: Faker::Color.color_name,
          user_name: usernames.sample
          )
  user.save!
  user = create_pics(pics[i], user.id, user)
  user.save!
end
puts "creating Users"

post_one = Post.new(post_type: "Share",
                    description: "I elevate my casual look with a touch of elegance. Effortless style is the key to turning heads.",
                    category: "Street Style",
                    occasion: "Casual Outing",
                    brand_tag: "Nike",
                    size_rating: [1,2,3,4,5].sample,
                    user_id: (1..10).to_a.sample)
                    post_one.save!

                    post = create_pics(images_share[4], post_one.id, post_one)
                    post.save!

10.times do |i|
  post = Post.new(post_type: "Share",
              description: Faker::Movies::Departed.quote,
              category:['street style', 'casual wear', 'athleisure', 'vintage', 'business attire', 'beachwear', 'ethnic wear',
                        'glamorous', 'smart casual', 'bohemian'].sample,
              occasion: ['party', 'business meeting', 'casual outing', 'wedding', 'formal event', 'workout', 'date night',
                        'vacation', 'interview', 'girl night'].sample,
              brand_tag: ['canada goose', 'a.p.c.', 'prada', 'levis', 'nike', 'dickies', 'adidas', 'burbery', 'fred perry',
                          'arket'].sample,
              size_rating: [1,2,3,4,5].sample,
              user: User.all.sample
            )

            post.save!
            final_post = create_pics(images_share[i], post.id, post)
            final_post.save!

    8.times do
      comment = Comment.new(content: ["Absolutely slaying it! 🔥", "Obsessed with this look! 😍", "You're a style icon!", "You radiate positivity through your fashion!",
      "Embracing the beautiful soul within!", "Your fashion choices are always on point! 👌", "You know how to turn heads!",
      "You're a breath of fresh air in the fashion world!", "Daring and delightful!", "Fashionably laid-back! 👌"].sample,
      user:  User.all.sample,
      post:  Post.all.sample)
      comment.save!
    end
end
puts "creating Posts Share"

10.times do |i|
  post = Post.new(post_type: "Ask",
                  description: Faker::Movies::Departed.quote,
                  category:['street style', 'casual wear', 'athleisure', 'vintage', 'business attire', 'beachwear', 'ethnic wear',
                            'glamorous', 'smart casual', 'bohemian'].sample,
                  occasion: ['party', 'business meeting', 'casual outing', 'wedding', 'formal event', 'workout', 'date night',
                            'vacation', 'interview', 'girl night'].sample,
                  brand_tag: ['canada goose', 'a.p.c.', 'prada', 'levis', 'nike', 'dickies', 'adidas', 'burbery', 'fred perry',
                              'arket'].sample,
                  user: User.all.sample,
                  size_rating: [1,2,3,4,5].sample)

                  post.save!
                  post = create_pics(images_ask[i], post.id, post)
                  post.save!

    8.times do
      feedback = Feedback.new(category: ['street style', 'casual wear', 'athleisure', 'vintage', 'business attire', 'beachwear', 'ethnic wear',
      'glamorous', 'smart casual', 'bohemian'].sample,
      feedback: ["Don't be afraid to mix patterns and textures for a unique and fashionable outfit.",
      "Play with proportions by pairing a loose-fitting top with fitted bottoms or vice versa.",
      "Experiment with layering by wearing a turtleneck under a slip dress or jumpsuit.",
      "Don't forget to pay attention to the fit of your clothes; tailoring can make a big difference.",
      "Don't shy away from experimenting with bold and vibrant colors to make a statement.",
      "Consider the occasion and dress accordingly; opt for more formal attire for special events.",
      "Invest in quality basics like a white tee, black pants, and a little black dress.",
      "Play with different shoe styles to create diverse looks, from casual to dressy.",
      "Don't be afraid to try new trends and incorporate them into your personal style.",
      "Consider the season and dress accordingly, layering for warmth or opting for lighter fabrics in summer."].sample,
      size_rating: [1,2,3,4,5].sample,
      color_rating: [1,2,3,4,5].sample,
      occasion_rating: [1,2,3,4,5].sample,
      overall_style_rating: [1,2,3,4,5].sample,
      user: User.all.sample,
      post: Post.all.sample)
    feedback.save!
    end
end
puts "creating Posts Ask!"

comment = Comment.new(content: "Absolutely slaying it! 🔥",
                      user_id: joanna.id,
                      post_id: post_one.id)
comment.save!

feedback = Feedback.new(category: "Street Style",
                        feedback: "Balance oversized pieces with more fitted ones to create a well-proportioned outfit.",
                        size_rating: [1,2,3,4,5].sample,
                        color_rating: [1,2,3,4,5].sample,
                        occasion_rating: [1,2,3,4,5].sample,
                        overall_style_rating: [1,2,3,4,5].sample,
                        user_id: joanna.id,
                        post_id: post_one.id)
feedback.save!

followed = Followed.new(user_id: maria.id)
followed.save!

follower = Follower.new(user_id: carolina.id)
follower.save!

like = Like.new(user_id: joanna.id,
                post_id: post_one.id)
like.save!

saved_post = SavedPost.new(user_id: joanna.id,
                          post_id: post_one.id)
saved_post.save!

user_follower = UserFollower.new(user_id: joanna.id,
                                followed_id: followed.id,
                                follower_id: follower.id)
user_follower.save!

puts "cleaning DB"
puts "DB preparation"
puts "creating Users"
