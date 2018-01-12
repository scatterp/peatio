puts "Members:".blue
admin_identity = Identity.find_or_create_by(email: ENV['ADMIN_EMAIL'])
admin_identity.password = admin_identity.password_confirmation = ENV['ADMIN_PASSWORD']
admin_identity.is_active = true
admin_identity.save!

admin_member = Member.find_or_create_by(email: ENV['ADMIN_EMAIL'])
admin_member.authentications.where(provider: :identity, uid: admin_identity.id).first_or_create
admin_member.save!
puts "  Admin Member".blue
puts

