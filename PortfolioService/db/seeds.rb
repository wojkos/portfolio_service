Skill.create!(title: 'Rails', skill_percent: 60 )
Skill.create!(title: 'HTML', skill_percent: 80 )
Skill.create!(title: 'Wordpress', skill_percent: 70 )
Skill.create!(title: 'Vue', skill_percent: 30 )

puts 'Created 4 skills'

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts 'Created 3 topics'

10.times do |post|
  case post
  when 0..3
    @topic = Topic.find(1)
  when 4..6
    @topic = Topic.find(2)
  when 7..9
    @topic = Topic.find(3)
  end
  Post.create!(
    title: "My post title #{post}",
    body: 'Lorem ipsum doloros edum noe dritut bre. Goden nolo fis est duri.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis eros eget justo facilisis tempus id id risus. Pellentesque orci est, pulvinar in vestibulum eu, mattis et nulla. Praesent bibendum nisl eget justo bibendum blandit. Fusce sit amet erat sed quam finibus fermentum in nec risus. Sed dui eros, convallis nec fermentum imperdiet, volutpat venenatis sapien. Aliquam porta arcu in placerat malesuada. Integer a sagittis neque. Fusce suscipit eget mauris quis auctor. Cras nec risus nec nisl convallis viverra. Vestibulum convallis odio a luctus scelerisque. Phasellus sed pretium mauris. Mauris non ante nec turpis viverra sollicitudin.',
    topic_id: @topic.id
  )
end

puts 'Created 10 skills'

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio item #{portfolio_item}",
    subtitle: "Portfolio subtitle #{portfolio_item}",
    body: 'Lorem ipsum doloros edum noe dritut bre. Goden nolo fis est duri.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis eros eget justo facilisis tempus id id risus. Pellentesque orci est, pulvinar in vestibulum eu, mattis et nulla. Praesent bibendum nisl eget justo bibendum blandit. Fusce sit amet erat sed quam finibus fermentum in nec risus. Sed dui eros, convallis nec fermentum imperdiet, volutpat venenatis sapien. Aliquam porta arcu in placerat malesuada. Integer a sagittis neque. Fusce suscipit eget mauris quis auctor. Cras nec risus nec nisl convallis viverra. Vestibulum convallis odio a luctus scelerisque. Phasellus sed pretium mauris. Mauris non ante nec turpis viverra sollicitudin.',
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x150'
  )
end

puts 'Created 9 portfolio items'

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}",
    portfolio_id: Portfolio.last.id
  )
end

puts 'Created 3 technologies'