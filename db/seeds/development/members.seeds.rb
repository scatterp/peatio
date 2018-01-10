foo = Identity.create(email: 'foo@peatio.dev', password: NORMAL_PASSWORD, password_confirmation: NORMAL_PASSWORD, is_active: true)
foo_member = Member.create(email: foo.email)
foo_member.authentications.build(provider: 'identity', uid: foo.id)
foo_member.tag_list.add 'vip'
foo_member.tag_list.add 'hero'
foo_member.save

bar = Identity.create(email: 'bar@peatio.dev', password: NORMAL_PASSWORD, password_confirmation: NORMAL_PASSWORD, is_active: true)
bar_member = Member.create(email: bar.email)
bar_member.authentications.build(provider: 'identity', uid: bar.id)
bar_member.tag_list.add 'vip'
bar_member.tag_list.add 'hero'
bar_member.save
