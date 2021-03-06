feature "Creating a new listing" do

  scenario "Owner submits a listing for their space" do
    visit '/listings/new'

    fill_in('name', with: 'Sunny palace')
    fill_in('description', with: "Russell's crib")
    fill_in('price', with: 5000)
    fill_in('start_date', with: '31/01/2016')
    fill_in('end_date', with: '01/01/2017')
    click_button('List my Space')
    expect(page).to have_current_path('/listings')
    expect(page).to have_content("Sunny palace")
  end
end
