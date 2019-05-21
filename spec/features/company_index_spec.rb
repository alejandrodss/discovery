require 'rails_helper'

RSpec.describe "Show company list" do
  it "show all companies registered on platform" do
    Company.create(name: "Company1", company_identification: "190", industry_type: "Technology", legal_representative: "Alan")
    Company.create(name: "Company2", company_identification: "180", industry_type: "Marketing", legal_representative: "Daisy")
    Company.create(name: "Company3", company_identification: "170", industry_type: "Food", legal_representative: "Lawrence")

    visit companies_path

    expect(Company.all.count).to eq(3)
    expect(page).to have_content("List of companies")
    expect(page).to have_content("Company1")
    expect(page).to have_content("Company2")
    expect(page).to have_content("Company3")
  end
end
