class Admin::AuthorsController < Admin::CoreController
  administrate_me do |admin|
    admin.search :first_name, :last_name
  end
end

