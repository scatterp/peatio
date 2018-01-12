# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  aasm_state :string
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Ticket do
  context "Validation" do
    it "Both title and content is empty" do
      ticket = Ticket.new
      expect(ticket.valid?).to eq false
    end

    it "Title is empty" do
      ticket = Ticket.new(content: 'xman is here')
      expect(ticket.valid?).to eq true
    end

    it "Content is empty" do
      ticket = Ticket.new(title: 'xman is here')
      expect(ticket.valid?).to eq true
    end

  end

  context "#title_for_display" do
    let(:text) { 'alsadkjf aslkdjf aslkdjfla skdjf alsdkjf dlsakjf lasdkjf sadkfasdf xx' }

    it "title is present" do
      ticket = create(:ticket, title: text)
      expect(ticket.title_for_display).to eq "alsadkjf aslkdjf aslkdjfla skdjf alsdkjf dlsakjf lasdkjf ..."
    end

    it "title is blank" do
      ticket = create(:ticket, content: text)
      expect(ticket.title_for_display).to eq "alsadkjf aslkdjf aslkdjfla skdjf alsdkjf dlsakjf lasdkjf ..."
    end
  end

  # describe "#send_notification" do
  #   let(:ticket) { create(:ticket) }
  #   let(:mailer) { mock() }
  #   before do
  #     mailer.stubs(:deliver)
  #     ticket
  #   end
  #
  #   after do
  #     ticket.send(:send_notification)
  #   end
  #
  #   it "should notify the admin" do
  #     TicketMailer.expects(:admin_notification).with(ticket.id).returns(mailer)
  #   end
  # end
end
