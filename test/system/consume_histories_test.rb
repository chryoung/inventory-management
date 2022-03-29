require "application_system_test_case"

class ConsumeHistoriesTest < ApplicationSystemTestCase
  setup do
    @consume_history = consume_histories(:one)
  end

  test "visiting the index" do
    visit consume_histories_url
    assert_selector "h1", text: "Consume histories"
  end

  test "should create consume history" do
    visit consume_histories_url
    click_on "New consume history"

    fill_in "Consume on", with: @consume_history.consume_on
    fill_in "Inventory", with: @consume_history.inventory_id
    fill_in "Quantity", with: @consume_history.quantity
    click_on "Create Consume history"

    assert_text "Consume history was successfully created"
    click_on "Back"
  end

  test "should update Consume history" do
    visit consume_history_url(@consume_history)
    click_on "Edit this consume history", match: :first

    fill_in "Consume on", with: @consume_history.consume_on
    fill_in "Inventory", with: @consume_history.inventory_id
    fill_in "Quantity", with: @consume_history.quantity
    click_on "Update Consume history"

    assert_text "Consume history was successfully updated"
    click_on "Back"
  end

  test "should destroy Consume history" do
    visit consume_history_url(@consume_history)
    click_on "Destroy this consume history", match: :first

    assert_text "Consume history was successfully destroyed"
  end
end
