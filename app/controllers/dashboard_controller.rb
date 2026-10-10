
class DashboardController < ApplicationController
  def index
    @departments = Department.includes(:users).all

    @devices_by_department = Department.includes(users: :devices).all

    # Number of licenses available for each software
    @license_counts = {
      "Microsoft Office" => 10,
      "Microsoft Windows" => 10,
      "Adobe Pro" => 10
    }

    # Number of license assignments currently in use
    @license_usage = SoftwareLicense.group(:name).count
  end
end

