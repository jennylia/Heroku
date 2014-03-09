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
    #variables for output of database items
    #the web_contents ivar contains an array 
    #of rows
    @web_contents  = open('http://pub.data.gov.bc.ca/datasets/174267/hlbc_walkinclinics.txt') {|f| 
      f.readlines 
    }

    #look at each row, break it up into fields
    #place fields into database
    @web_contents.each_with_index do |x, index|
      puts ("\n\n\n\n")
      #if the clinic table is empty
      #create the row, and fill it

      if (Clinic.find(index+1).SV_TAXONOMY == "")
        @clinics = Clinic.new

        #take the line, split it by tabs
        #each line == a row in the database
        #put each field into the table row
        oneRowSplit = x.split("\t")
        @clinics.SV_TAXONOMY = oneRowSplit.fetch(0, "out of bounds")
        @clinics.TAXONOMY_NAME = oneRowSplit.fetch(1, "out of bounds")
        @clinics.RG_REFERENCE = oneRowSplit.fetch(2, "out of bounds")
        @clinics.RG_NAME = oneRowSplit.fetch(3, "out of bounds")
        @clinics.SV_REFERENCE = oneRowSplit.fetch(4, "out of bounds")
        @clinics.SV_NAME = oneRowSplit.fetch(5, "out of bounds")
        @clinics.SV_DESCRIPTION = oneRowSplit.fetch(6, "out of bounds")
        @clinics.SL_REFERENCE = oneRowSplit.fetch(7, "out of bounds")
        @clinics.LC_REFERENCE = oneRowSplit.fetch(8, "out of bounds")
        @clinics.PHONE_NUMBER = oneRowSplit.fetch(9, "out of bounds")
        @clinics.WEBSITE = oneRowSplit.fetch(10, "out of bounds")
        @clinics.EMAIL_ADDRESS = oneRowSplit.fetch(11, "out of bounds")
        @clinics.WHEELCHAIR_ACCESSIBLE = oneRowSplit.fetch(12, "out of bounds")
        @clinics.LANGUAGE = oneRowSplit.fetch(13, "out of bounds")
        @clinics.HOURS = oneRowSplit.fetch(14, "out of bounds")
        @clinics.STREET_NUMBER = oneRowSplit.fetch(15, "out of bounds")
        @clinics.STREET_NAME = oneRowSplit.fetch(16, "out of bounds")
        @clinics.STREET_TYPE = oneRowSplit.fetch(17, "out of bounds")
        @clinics.STREET_DIRECTION = oneRowSplit.fetch(18, "out of bounds")
        @clinics.CITY = oneRowSplit.fetch(19, "out of bounds")
        @clinics.PROVINCE = oneRowSplit.fetch(20, "out of bounds")
        @clinics.POSTAL_CODE = oneRowSplit.fetch(21, "out of bounds")
        @clinics.LATITUDE = oneRowSplit.fetch(22, "out of bounds")
        @clinics.LONGITUDE = oneRowSplit.fetch(23, "out of bounds")
        #@clinics.811_LINK = oneRowSplit.fetch(24, "out of bounds")
        @clinics.save

      #else if the clinics table is already filled
      #do nothing  
      else


        #TODO: parse x by tabs, place into database table clinics
        # x.split("\t").each do |y|
        #   puts y
          
        #   @clinics = Clinic.find(index+1)
        #   @clinics.SV_TAXONOMY = y
          
        # end
        
      end

    end

    
    puts Clinic.find(1).SV_DESCRIPTION
    


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
