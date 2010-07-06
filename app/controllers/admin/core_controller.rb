class Admin::CoreController < ApplicationController
  before_filter :require_user

  def owner
      "Ruby on Rails 2010"
    end

  def app_name
    "Bookr v.1.0"
  end

  set_module :authors
  set_module :tags
end

