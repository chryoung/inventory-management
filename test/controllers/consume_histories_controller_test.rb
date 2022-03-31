require "test_helper"

class ConsumeHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
    @consume_history = consume_histories(:one)
  end

  test "should get new" do
    get new_inventory_consume_history_url(@inventory)
    assert_response :success
  end

  test "should create consume_history" do
    assert_difference("ConsumeHistory.count") do
      post inventory_consume_histories_url(@inventory) , params: { consume_history: { consume_on: @consume_history.consume_on, quantity: @inventory.left_quantity } }
    end

    assert_redirected_to inventory_url(@inventory)
  end

  test "should get edit" do
    get edit_consume_history_url(@consume_history)
    assert_response :success
  end

  test "should update consume_history" do
    patch consume_history_url(@consume_history), params: { consume_history: { consume_on: @consume_history.consume_on, quantity: 3 } }

    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy consume_history" do
    assert_difference("ConsumeHistory.count", -1) do
      delete consume_history_url(@consume_history)
    end

    assert_redirected_to inventory_url(@inventory)
  end
end
