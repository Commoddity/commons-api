# frozen_string_literal: true

class UpdateBillsPassed
  include Interactor
  # Called by save_events
  # This interactor updates whether the bill has been passed or defeated based on the contents of the event title

  def call
    events = context.events

    events.each do |event|
      bill = Bill.find_by code: event['code']
      if event['title'].include? 'Royal Assent'
        bill.update("passed": true)
        p "#{bill['code']} #{bill['title']} Passed on #{event['publication_date']}"
      elsif (event['title'].include? 'Defeated') || (event['title'].include? 'Not Proceeded With')
        bill.update("passed": false)
        p "#{bill['code']} #{bill['title']} Defeated on #{event['publication_date']}"
      end
    end
    p 'Finished updating bills ...'
  end
end
