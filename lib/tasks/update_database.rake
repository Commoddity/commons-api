# frozen_string_literal: true

namespace :db do
  desc 'Runs the WriteToDb Interactor Organier to update the database with current bills and events.'
  task update_database: :environment do
    puts "Updating Database at #{DateTime.now} ..."
    url = ENV['LEGISINFO_URL']
    WriteToDb.call({ url: url })
    puts "Finished Updating Database at: #{Time.now} - Success!"
  end
end
