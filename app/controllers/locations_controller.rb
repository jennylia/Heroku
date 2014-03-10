#this requires is for the file io
require 'open-uri'

class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @json = Location.all.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json {render json: @locations}

    #if the table Clinics is empty
    #look at each row, break it up into fields
    #place fields into database
    if (Clinic.find(:all).empty?)
      #variables for output of database items
      #the web_contents ivar contains an array 
      #of rows
      @web_contents  = open('http://pub.data.gov.bc.ca/datasets/174267/hlbc_walkinclinics.txt') {|f| 
        f.readlines 
      }

      @web_contents.each_with_index do |x, index|
        

        #cleans up any non-utf8 text
        x = x.encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "")
        
        #if the clinic table is empty
        #create the row, and fill it

        #take the line, split it by tabs
        #each line == a row in the database
        #put each field into the table row
        oneRowSplit = x.split("\t")
        
        @clinics = Clinic.new
        @clinics.SV_TAXONOMY = oneRowSplit.fetch(0, "")
        @clinics.TAXONOMY_NAME = oneRowSplit.fetch(1, "")
        @clinics.RG_REFERENCE = oneRowSplit.fetch(2, "")
        @clinics.RG_NAME = oneRowSplit.fetch(3, "")
        @clinics.SV_REFERENCE = oneRowSplit.fetch(4, "")
        @clinics.SV_NAME = oneRowSplit.fetch(5, "")
        @clinics.SV_DESCRIPTION = oneRowSplit.fetch(6, "")
        @clinics.SL_REFERENCE = oneRowSplit.fetch(7, "")
        @clinics.LC_REFERENCE = oneRowSplit.fetch(8, "")
        @clinics.PHONE_NUMBER = oneRowSplit.fetch(9, "")
        @clinics.WEBSITE = oneRowSplit.fetch(10, "")
        @clinics.EMAIL_ADDRESS = oneRowSplit.fetch(11, "")
        @clinics.WHEELCHAIR_ACCESSIBLE = oneRowSplit.fetch(12, "")
        @clinics.LANGUAGE = oneRowSplit.fetch(13, "")
        @clinics.HOURS = oneRowSplit.fetch(14, "")
        @clinics.STREET_NUMBER = oneRowSplit.fetch(15, "")
        @clinics.STREET_NAME = oneRowSplit.fetch(16, "")
        @clinics.STREET_TYPE = oneRowSplit.fetch(17, "")
        @clinics.STREET_DIRECTION = oneRowSplit.fetch(18, "")
        @clinics.CITY = oneRowSplit.fetch(19, "")
        @clinics.PROVINCE = oneRowSplit.fetch(20, "")
        @clinics.POSTAL_CODE = oneRowSplit.fetch(21, "")
        @clinics.LATITUDE = oneRowSplit.fetch(22, "")
        @clinics.LONGITUDE = oneRowSplit.fetch(23, "")
        #@clinics.811_LINK = oneRowSplit.fetch(24, "")
        @clinics.save
        
        #@locationLatLon = Location.new
        #@locationLatLon.longitude = 49
        # @locationLatLon.save

        #fill the locations database with latlon locations
        # if (!oneRowSplit[22].nil? || !oneRowSplit[23].nil?)

        @locationsFillTable = Location.new
        @locationsFillTable.name = oneRowSplit.fetch(3, "")
        @locationsFillTable.address = oneRowSplit.fetch(15, "") + " " + oneRowSplit.fetch(16, "") + " " + oneRowSplit.fetch(17, "") + " Vancouver, BC"
        @locationsFillTable.longitude = oneRowSplit.fetch(23, "")
        @locationsFillTable.latitude = oneRowSplit.fetch(22, "")
        @locationsFillTable.save
        
        # end
      end
        #else if the clinics table is already filled
        #do nothing 
    end

    #instance variable for display on page
    @allClinicsData = Clinic.all
    
    # @clinics = Clinic.find(1)
    # @clinics.SV_TAXONOMY = "testing"
    # @clinics.TAXONOMY_NAME = "testing2"
    # @clinics.save

    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :address, :longitude, :latitude, :gmaps)
    end
end
