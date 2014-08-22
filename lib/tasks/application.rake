namespace :application do
  desc 'Rebuilds the whole cache of agreement between members'
  task :update_member_distances_cache => :environment do
    MemberDistance.update_all!
  end

  desc 'Reloads members, offices and electorates from XML files'
  task :reload_member_data, [:xml_data_directory] => :environment do |t, args|
    Rails.logger = ActiveSupport::Logger.new(STDOUT)
    Rails.logger.level = 1
    loader = DataLoader::MembersXML.new(args[:xml_data_directory])
    loader.load_all
  end

  desc 'Update cache of guessed whips'
  task :update_whip_cache => :environment do
    Whip.update_all!
  end

  desc 'Load divisions from XML for a specified date'
  task :load_divisions_xml, [:xml_directory, :date, :house] => :environment do |t, args|
    DebatesXML::Parser.run!(args[:xml_directory], date: args[:date], house: args[:house])
  end
end
