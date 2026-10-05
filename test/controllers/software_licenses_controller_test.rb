require "test_helper"

class SoftwareLicensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @software_license = software_licenses(:one)
  end

  test "should get index" do
    get software_licenses_url
    assert_response :success
  end

  test "should get new" do
    get new_software_license_url
    assert_response :success
  end

  test "should create software_license" do
    assert_difference("SoftwareLicense.count") do
      post software_licenses_url, params: { software_license: { license_key: @software_license.license_key, name: @software_license.name, user_id: @software_license.user_id } }
    end

    assert_redirected_to software_license_url(SoftwareLicense.last)
  end

  test "should show software_license" do
    get software_license_url(@software_license)
    assert_response :success
  end

  test "should get edit" do
    get edit_software_license_url(@software_license)
    assert_response :success
  end

  test "should update software_license" do
    patch software_license_url(@software_license), params: { software_license: { license_key: @software_license.license_key, name: @software_license.name, user_id: @software_license.user_id } }
    assert_redirected_to software_license_url(@software_license)
  end

  test "should destroy software_license" do
    assert_difference("SoftwareLicense.count", -1) do
      delete software_license_url(@software_license)
    end

    assert_redirected_to software_licenses_url
  end
end
