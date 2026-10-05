class SoftwareLicensesController < ApplicationController
  before_action :set_software_license, only: %i[ show edit update destroy ]

  # GET /software_licenses or /software_licenses.json
  def index
    @software_licenses = SoftwareLicense.all
  end

  # GET /software_licenses/1 or /software_licenses/1.json
  def show
  end

  # GET /software_licenses/new
  def new
    @software_license = SoftwareLicense.new
  end

  # GET /software_licenses/1/edit
  def edit
  end

  # POST /software_licenses or /software_licenses.json
  def create
    @software_license = SoftwareLicense.new(software_license_params)

    respond_to do |format|
      if @software_license.save
        format.html { redirect_to @software_license, notice: "Software license was successfully created." }
        format.json { render :show, status: :created, location: @software_license }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @software_license.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /software_licenses/1 or /software_licenses/1.json
  def update
    respond_to do |format|
      if @software_license.update(software_license_params)
        format.html { redirect_to @software_license, notice: "Software license was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @software_license }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @software_license.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /software_licenses/1 or /software_licenses/1.json
  def destroy
    @software_license.destroy!

    respond_to do |format|
      format.html { redirect_to software_licenses_path, notice: "Software license was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software_license
      @software_license = SoftwareLicense.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def software_license_params
      params.expect(software_license: [ :name, :license_key, :user_id ])
    end
end
