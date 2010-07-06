class Admin::MembershipsController < Admin::CoreController
  administrate_me do |admin|
    admin.search :card_id, :first_name, :last_name
    admin.filters do |f|
      f.set :active, :conditions => {:active => true}
      f.set :suspended, :conditions => {:active => false}
    end
  end
end

