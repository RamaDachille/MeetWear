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

UserFollower.destroy_all
User.destroy_all
SavedPost.destroy_all
Post.destroy_all
Comment.destroy_all
Feedback.destroy_all
Followed.destroy_all
Follower.destroy_all
Like.destroy_all

pics = [
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818891/Meetwear/01%20Marina/00_marina_profile_fsrsyu.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818784/Meetwear/02%20Joanna/00_joanna_profile_mcxmge.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818658/Meetwear/03%20Pamela/00_pamela_profile_yvl3np.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818623/Meetwear/04%20Rama/00_rama_profile_xenksm.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686819781/Meetwear/05%20Bruno/00_bruno_profile_ixfs7u.png",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818364/Meetwear/06%20Esther/00_esther_profile_ecbyvb.png",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818018/Meetwear/10%20Kusha%20Kapila/06_ask_kusha_kapila_so2swf.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817765/Meetwear/11%20Chriselle%20Lm/00_chriselle_lim_profile_subiof.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818081/Meetwear/08%20Thais%20Araujo/00_thais_araujo_profile_xjjjxc.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817693/Meetwear/12%20Mimi/00_mimi_mabbmy.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818037/Meetwear/09%20Victoria%20Rocha/00_vih_rocha_profile_ynkdts.jpg"

]
users = [
  { email: "marina@example.com", password: 123456, first_name: "Marina", last_name: "Stepanova", user_name: "Marina" },
  { email: "joanna@example.com", password: 123456, first_name: "Joanna", last_name: "Wojtowicz", user_name: "Joanna" },
  { email: "pamela@example.com", password: 123456, first_name: "Pamela", last_name: "Hartwig", user_name: "Pamela" },
  { email: "rama@example.com", password: 123456, first_name: "Rama", last_name: "D'Achille", user_name: "Rama" },
  { email: "bruno@example.com", password: 123456, first_name: "Bruno", last_name: "Belchior", user_name: "Bruno" },
  { email: "esther@example.com", password: 123456, first_name: "Esther", last_name: "Kimatu", user_name: "Esther" },
  { email: "kusha@example.com", password: 123456, first_name: "Kusha", last_name: "Kapila", user_name: "Kusha" },
  { email: "chriselle@example.com", password: 123456, first_name: "Chriselle", last_name: "Lim", user_name: "Chriselle" },
  { email: "thais@example.com", password: 123456, first_name: "Thais", last_name: "Araujo", user_name: "Thais" },
  { email: "mimi@example.com", password: 123456, first_name: "Mimi", last_name: "Mimi", user_name: "Mimi" },
  { email: "victoria@example.com", password: 123456, first_name: "Victoria", last_name: "Victoria", user_name: "Victoria" },
]
users.size.times do |i|
  user = User.new(users[i])
  user.save!
  user = create_pics(pics[i], user.id, user)
  user.save!
end
puts "creating Users"

images_ask = [
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818056/Meetwear/09%20Victoria%20Rocha/08_vih_rocha_vfrfkc.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817724/Meetwear/12%20Mimi/ask_x05mmf.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818116/Meetwear/08%20Thais%20Araujo/04_ask_thais_araujo_lk9feh.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817797/Meetwear/11%20Chriselle%20Lm/06_chriselle_lim_pfbl5b.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818012/Meetwear/10%20Kusha%20Kapila/04_ask_kusha_kapila_nsqxdg.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818257/Meetwear/06%20Esther/03_ask_esther_cbbnkj.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818834/Meetwear/02%20Joanna/02_joanna_ask_jpt11f.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686825785/Meetwear/05%20Bruno/01_bruno_ask_ivtpvr.jpg",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686831575/Meetwear/03%20Pamela/02_pamela_ask_jhekam.png",
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686839632/Meetwear/04%20Rama/01_rama_share_tlkp6w.jpg"

]
asks = [
  # 1
  {
    post_type: "Ask",
    description: "I'm planning to attend a beach wedding.Is that appropriate attire for such an event?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "victoria@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 2
  {
    post_type: "Ask",
    description: "Does this color combination work well for a casual outing?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "mimi@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 3
  {
    post_type: "Ask",
    description: "I want to wear a hat, but I'm not sure if it will go well with my overall outfit. Thoughts?"    ,
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "thais@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 4
  {
    post_type: "Ask",
    description: "I'm going on a date tonight and I want to make a good impression.",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "chriselle@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 5
  {
    post_type: "Ask",
    description: "'m attending a wedding soon. What kind of accessories would complement my outfit?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "kusha@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 6
  {
    post_type: "Ask",
    description: "I'm going to a music festival. What outfit would be both trendy and comfortable?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "esther@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 7
  {
    post_type: "Ask",
    description: "I have a business dinner coming up. How can I dress professionally yet stylishly?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "joanna@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 8
  {
    post_type: "Ask",
    description: "I want to revamp my everyday casual wardrobe. Any suggestions for trendy pieces?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "bruno@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },

  # 9 Pamela
  {
    post_type: "Ask",
    description: "I'm having trouble deciding which shoes to pair with this dress. Any suggestions?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "pamela@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },
  # 10
  {
    post_type: "Ask",
    description: "I'm going to a charity gala. What kind of formal attire would be appropriate for the occasion?",
    category:['Street style', 'Casual wear', 'Athleisure', 'Vintage', 'Business attire', 'Beachwear', 'Ethnic wear',
              'Glamorous', 'Smart casual', 'Bohemian'].sample,
    occasion: ['Party', 'Business meeting', 'Casual outing', 'Wedding', 'Formal event', 'Workout', 'Date night',
              'Vacation', 'Interview', 'Girl night'].sample,
    brand_tag: ['Moncler', 'A.P.C.', 'Stussy', 'Nike', 'Dickies', 'Adidas', 'Burbery', 'Fred Perry',
                'COS'].sample,
    user: User.find_by(email: "rama@example.com"),
    size_rating: [1, 2, 3, 4, 5].sample
  },

]

asks.size.times do |i|
  post = Post.new(asks[i])

  post.save!
  post = create_pics(images_ask[i], post.id, post)
  post.save!

    # 8.times do
    #   feedback = Feedback.new(category: ['street style', 'casual wear', 'athleisure', 'vintage', 'business attire', 'beachwear', 'ethnic wear',
    #   'glamorous', 'smart casual', 'bohemian'].sample,
    #   feedback: ["Don't be afraid to mix patterns and textures for a unique and fashionable outfit.",
    #   "Play with proportions by pairing a loose-fitting top with fitted bottoms or vice versa.",
    #   "Experiment with layering by wearing a turtleneck under a slip dress or jumpsuit.",
    #   "Don't forget to pay attention to the fit of your clothes; tailoring can make a big difference.",
    #   "Don't shy away from experimenting with bold and vibrant colors to make a statement.",
    #   "Consider the occasion and dress accordingly; opt for more formal attire for special events.",
    #   "Invest in quality basics like a white tee, black pants, and a little black dress.",
    #   "Play with different shoe styles to create diverse looks, from casual to dressy.",
    #   "Don't be afraid to try new trends and incorporate them into your personal style.",
    #   "Consider the season and dress accordingly, layering for warmth or opting for lighter fabrics in summer."].sample,
    #   size_rating: [1,2,3,4,5].sample,
    #   color_rating: [1,2,3,4,5].sample,
    #   occasion_rating: [1,2,3,4,5].sample,
    #   overall_style_rating: [1,2,3,4,5].sample,
    #   user: User.all.sample,
    #   post: Post.all.sample)
    # feedback.save!
    # end
end
puts "creating Posts Ask!"

images_share = [
  # 1 victoria
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686840592/Meetwear/09%20Victoria%20Rocha/05_vih_rocha_xmzb4s.jpg",
  # 2 Thais
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818130/Meetwear/08%20Thais%20Araujo/09_thais_araujo_wutuyc.jpg",
  # 3 Mimi
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817732/Meetwear/12%20Mimi/share_n0r3ft.jpg",
  # 4  Marina 1
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818911/Meetwear/01%20Marina/01_marina_share_hq2suj.jpg",
  # 5 Victoria 2
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818046/Meetwear/09%20Victoria%20Rocha/02_vih_rocha_txanmc.jpg",
  # 6 Kusha
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817987/Meetwear/10%20Kusha%20Kapila/02_share_kusha_kapila_w7dlpd.jpg",
  # 7 Chriselle
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686817778/Meetwear/11%20Chriselle%20Lm/02chriselle_lim_jlxva1.jpg",
  # 8 Esther
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818204/Meetwear/06%20Esther/01_share_esther_wtqi7t.jpg",
  # 9 Bruno
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686825788/Meetwear/05%20Bruno/02_bruno_share_mhzq8b.jpg",
  # 10 Pamela
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686831578/Meetwear/03%20Pamela/03_pamela_share_bsgogg.png",
  # 11 Rama
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818549/Meetwear/04%20Rama/01_rama_share_uqquro.jpg",
  # 12 Joanna
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818808/Meetwear/02%20Joanna/01_joanna_share_ratkjv.jpg",
  # Marina
  "https://res.cloudinary.com/drtqvawhp/image/upload/v1686818933/Meetwear/01%20Marina/02_marina_share_qg8ypo.jpg"
]

posts = [
  # 1 victoria
  {
    post_type: "Share",
    description: "Fashion is an art, and I am the canvas. I paint the town red with my fearless fashion choices.",
    category: "Street Style",
    occasion: "Casual Outing",
    brand_tag: ['Stussy', 'Dickies', 'Burbery', 'COS'],
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'victoria@example.com')
  },
  # 2 Thais
  {
    post_type: "Share",
    description: "Step into the spotlight with confidence, as my timeless elegance transforms the runway into my own personal catwalk.",
    category: "Glamorous",
    occasion: "Formal event",
    brand_tag: "Saint Laurent",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'thais@example.com')
  },
  # 3 Mimi
  {
    post_type: "Share",
    description: "In a world of trends, I am a classic. My timeless fashion choices will never go out of style.",
    category: "Street Style",
    occasion: "Casual Outing",
    brand_tag: "Nike",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'mimi@example.com')
  },
  # 4  Marina 1
  {
    post_type: "Share",
    description: "With every step, my shoes make a statement. I leave a trail of confidence and leave them wondering where I got them.",
    category: "Smart casual'",
    occasion: "Date night",
    brand_tag: ['Stussy', 'Lala Berlin', 'Burbery'],
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'marina@example.com')
  },
  # 5 Victoria 2
  {
    post_type: "Share",
    description: "Fashion is a language that speaks volumes without words. I express myself fearlessly and watch the world listen.",
    category: "Street Style",
    occasion: "Girl night",
    brand_tag: ['Stussy', 'Dickies', 'Karl Lagerfeld'],
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'victoria@example.com')
  },
  # 6 Kusha
  {
    post_type: "Share",
    description: "Bold, vibrant, and unapologetic. My fashion choices reflect my zest for life.",
    category: "SGlamorous",
    occasion: "Wedding",
    brand_tag: "Giorgio Armani",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'kusha@example.com')
  },
  # 7 Chriselle
  {
    post_type: "Share",
    description: "Fashion is not just about clothes; it's a reflection of my personality. My style reflects the beautiful soul within.",
    category: "Street Style",
    occasion: "Casual Outing",
    brand_tag: "Atelier Materi",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'chriselle@example.com')
  },
  # 8 Esther
  {
    post_type: "Share",
    description: "Fashion is not about fitting in; it's about standing out. I embrace my uniqueness and become the trendsetter.",
    category: "Glamorous",
    occasion: "Wedding",
    brand_tag: "Gucci",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'esther@example.com')
  },
  # 9 Bruno
  {
    post_type: "Share",
    description: "Simplicity is the ultimate sophistication. My minimalistic fashion choices make a powerful statement.",
    category: "Street Style",
    occasion: "Casual Outing",
    brand_tag: "Nike",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'bruno@example.com')
  },
  # 10 Pamela
  {
    post_type: "Share",
    description: "Fashion is an expression of my individuality. I embrace my quirks, embrace my style, and let the world see the real me.",
    category: "Street Style",
    occasion: "Vacation",
    brand_tag: "Balmain",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'pamela@example.com')
  },
  # 11 Rama
  {
    post_type: "Share",
    description: "I dress to impress, even if the only person I'm impressing is myself. Self-confidence is the best outfit.",
    category: "Street Style",
    occasion: "Casual Outing",
    brand_tag: "Levis",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'rama@example.com')
  },
  # 12 Joanna
  {
    post_type: "Share",
    description: "Fashion has the power to inspire and empower. My fashion choices are a source of inspiration for others.",
    category: "Street Style",
    occasion: "Vacation",
    brand_tag: "Burberry'",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'joanna@example.com')
  },
  # 13 Marina
  {
    post_type: "Share",
    description: "Fashion is not about following trends, it's about creating my own. I am my own fashion icon and inspire others to do the same.",
    category: "Street Style",
    occasion: "Casual Outing",
    brand_tag: "Chanel",
    size_rating: [2, 3, 4, 5].sample,
    user: User.find_by(email: 'marina@example.com')
  }
]
# share posts look at share images share
posts.size.times do |i|
  post = Post.new(posts[i])
            post.save!
            final_post = create_pics(images_share[i], post.id, post)
            final_post.save!

    # 8.times do
    #   comment = Comment.new(content: ["Absolutely slaying it! 🔥", "Obsessed with this look! 😍", "You're a style icon!", "You radiate positivity through your fashion!",
    #   "Embracing the beautiful soul within!", "Your fashion choices are always on point! 👌", "You know how to turn heads!",
    #   "You're a breath of fresh air in the fashion world!", "Daring and delightful!", "Fashionably laid-back! 👌"].sample,
    #   user:  User.all.sample,
    #   post:  Post.all.sample)
    #   comment.save!
    #   final_comment = create_pics(images_share[i], post.id, post)
    #   final_comment.save!
    # end
end
puts "creating Posts Share"

# followed = Followed.new(user_id: maria.id)
# followed.save!

# follower = Follower.new(user_id: carolina.id)
# follower.save!

# like = Like.new(user_id: joanna.id,
#                 post_id: post_one.id)
# like.save!

# saved_post = SavedPost.new(user_id: joanna.id,
#                           post_id: post_one.id)
# saved_post.save!

# user_follower = UserFollower.new(user_id: joanna.id,
#                                 followed_id: followed.id,
#                                 follower_id: follower.id)
# user_follower.save!

puts "cleaning DB"
puts "DB preparation"
puts "creating Users"
