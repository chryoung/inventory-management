require "test_helper"

class ConsumeHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consume_history = consume_histories(:one)
  end

  test "should get new" do
    get new_consume_history_url
    assert_response :success
  end

  test "should create consume_history" do
    assert_difference("ConsumeHistory.count") do
      post consume_histories_url, params: { consume_history: { consume_on: @consume_history.consume_on, inventory_id: @consume_history.inventory_id, quantity: @consume_history.quantity } }
    end

    assert_redirected_to consume_history_url(ConsumeHistory.last)
  end

  test "should get edit" do
    get edit_consume_history_url(@consume_history)
    assert_response :success
  end

  test "should update consume_history" do
    patch consume_history_url(@consume_history), params: { consume_history: { consume_on: @consume_history.consume_on, inventory_id: @consume_history.inventory_id, quantity: @consume_history.quantity } }
    assert_redirected_to consume_history_url(@consume_history)
  end

  test "should destroy consume_history" do
    assert_difference("ConsumeHistory.count", -1) do
      delete consume_history_url(@consume_history)
    end

    assert_redirected_to consume_histories_url
  end
end
