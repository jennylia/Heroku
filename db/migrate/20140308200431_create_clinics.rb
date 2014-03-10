# encoding: utf-8

class CreateClinics < ActiveRecord::Migration
  def up

  	create_table :clinics do |t|
      	t.string "SV_TAXONOMY"
		t.string "TAXONOMY_NAME"
		t.string "RG_REFERENCE"
		t.string "RG_NAME"
		t.string "SV_REFERENCE"
		t.string "SV_NAME"
		t.string "SV_DESCRIPTION"
		t.string "SL_REFERENCE"
		t.string "LC_REFERENCE"
		t.string "PHONE_NUMBER"
		t.string "WEBSITE"
		t.string "EMAIL_ADDRESS"
		t.string "WHEELCHAIR_ACCESSIBLE"
		t.string "LANGUAGE"
		t.text "HOURS"
		t.string "STREET_NUMBER"
		t.string "STREET_NAME"
		t.string "STREET_TYPE"
		t.string "STREET_DIRECTION"
		t.string "CITY"
		t.string "PROVINCE"
		t.string "POSTAL_CODE"
		t.float "LATITUDE"
		t.float "LONGITUDE"
		t.string "811_LINK"
	 	t.timestamps
     end
     
  end

  def down
  	drop_table :clinics
  end
end
