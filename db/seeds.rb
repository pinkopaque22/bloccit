include RandomData
 15.times do
   Topic.create!(
     name:  RandomData.random_sentence,
     description:   RandomData.random_paragraph
   )
 end
 topics = Topic.all
 
 50.times do
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
posts = Post.all
 30.times do
  SponsoredPost.create!(
   topic:  topics.sample,
   title:  RandomData.random_sentence,
   body:   RandomData.random_paragraph,
   price:  99
   )
 end
   100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{SponsoredPost.count} sponsored_post created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 
 
 
