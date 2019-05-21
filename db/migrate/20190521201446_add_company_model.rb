class AddCompanyModel < ActiveRecord::Migration[5.2]
  def up
    create_table :companies do |t|
      t.string  "legal_representative", null: false
      t.string  "name", null: false
      t.string  "industry_type", null: false
      t.string  "company_identification", null: false
      t.string  "address"
      t.integer "postal_code"
    end
  end

  def down
    drop_table :companies
  end
end
