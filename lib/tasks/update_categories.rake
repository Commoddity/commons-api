namespace :db do
  desc "Runs the SaveUclassifyCategories Interactor Organier"
  task :update_categories => :environment do
    puts "Updating Categories at #{DateTime.now()}"
    ClassifyAndSaveCategories.call
    puts "Finished Updating Categories at: #{Time.now} - Success!"
  end
end
