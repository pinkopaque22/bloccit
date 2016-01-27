include RandomData

 15.times do
   SponsoredPost.create!(
     name: RandomData.random_sentence,
     description: RandomData.random_paragraph
   )
 end
 sponsored_post = SponsoredPost.all
 
 50.times do
   SponsoredPost.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  99
   )
 end
sponsored_post = SponsoredPost.all
 
 #100.times do
   #Comment.create!(
    # post: posts.sample,
     #body: RandomData.random_paragraph
   #)
 #end
 
 
 puts "Seed finished"
 puts "#{SponsoredPost.count} sponsored_post created"

#puts "#{Comment.count} comments created"
 
 
