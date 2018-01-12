foo = Identity.create(email: 'foo@peatio.dev', password: ENV['NORMAL_PASSWORD'], password_confirmation: ENV['NORMAL_PASSWORD'], is_active: true)
foo_member = Member.create(email: foo.email)
foo_member.authentications.where(provider: 'identity', uid: foo.id).first_or_create
foo_member.tag_list.add 'vip'
foo_member.tag_list.add 'hero'
foo_member.save!
puts "  Normal Member #{foo.email}".blue


bar = Identity.create(email: 'bar@peatio.dev', password: ENV['NORMAL_PASSWORD'], password_confirmation: ENV['NORMAL_PASSWORD'], is_active: true)
bar_member = Member.create(email: bar.email)
bar_member.authentications.where(provider: 'identity', uid: bar.id).first_or_create
bar_member.tag_list.add 'vip'
bar_member.tag_list.add 'hero'
bar_member.save!
puts "  Normal Member #{bar.email}".blue
