require 'test_helper'

class DinosaursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dinosaur = dinosaurs(:one)
  end

  test "should get index" do
    get dinosaurs_url, as: :json
    assert_response :success
  end

  test "should create dinosaur" do
    assert_difference('Dinosaur.count') do
      post dinosaurs_url, params: { dinosaur: { height: @dinosaur.height, image: @dinosaur.image, name: @dinosaur.name, weight: @dinosaur.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show dinosaur" do
    get dinosaur_url(@dinosaur), as: :json
    assert_response :success
  end

  test "should update dinosaur" do
    patch dinosaur_url(@dinosaur), params: { dinosaur: { height: @dinosaur.height, image: @dinosaur.image, name: @dinosaur.name, weight: @dinosaur.weight } }, as: :json
    assert_response 200
  end

  test "should destroy dinosaur" do
    assert_difference('Dinosaur.count', -1) do
      delete dinosaur_url(@dinosaur), as: :json
    end

    assert_response 204
  end
end
