class Admin::LoansController < Admin::CoreController
  administrate_me do |admin|
    admin.includes :membership, :book
    admin.search 'memberships.first_name', 'memberships.last_name', 'memberships.card_id', 'books.title'
    admin.order 'finished_on'
    admin.filters do |f|
      f.set :active, :conditions => ['canceled = ? and finished_on > ?', false, Time.now.utc.to_date]
      f.set :expired, :conditions => ['finished_on < ?', Time.now.utc.to_date]
      f.set :canceled, :conditions => {:canceled => true}
    end
  end
end

