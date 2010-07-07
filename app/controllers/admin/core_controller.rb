class Admin::CoreController < ApplicationController
  before_filter :require_user

  def owner
      "Ruby on Rails 2010"
    end

  def app_name
    "Bookr v.1.0"
  end

  set_module :loans
  set_module :books
  set_module :memberships
  set_module :authors
  set_module :categories
  set_module :tags
  set_module :packs
end

