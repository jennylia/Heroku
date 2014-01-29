package com.google.gwt.sample.clinicsvancouver.client;

import com.google.gwt.maps.client.*;
import com.google.gwt.maps.client.control.LargeMapControl;
import com.google.gwt.maps.client.geom.LatLng;
import com.google.gwt.maps.client.overlay.Marker;
import com.google.gwt.sample.clinicsvancouver.shared.FieldVerifier;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.Style.Unit;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockLayoutPanel;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootLayoutPanel;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class ClinicsVancouver implements EntryPoint {
	
	private VerticalPanel mainPanel = new VerticalPanel();  
	private FlexTable stocksFlexTable = new FlexTable();  
	private HorizontalPanel addPanel = new HorizontalPanel();  
	private TextBox newSymbolTextBox = new TextBox(); 
	
	/**
	 * The message displayed to the user when the server cannot be reached or
	 * returns an error.
	 */
	private static final String SERVER_ERROR = "An error occurred while "
			+ "attempting to contact the server. Please check your network "
			+ "connection and try again.";

	/**
	 * Create a remote service proxy to talk to the server-side Greeting service.
	 */
	private final GreetingServiceAsync greetingService = GWT
			.create(GreetingService.class);

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {
		final Label testLabel = new Label();
		testLabel.setText("Testing label");
		// Add the nameField and sendButton to the RootPanel
		// Use RootPanel.get() to get the entire body element
		addPanel.add(testLabel);
		RootPanel.get("mainWapper").add(addPanel);
		//maps
		//this api key for for google maps api v3
		Maps.loadMapsApi("AIzaSyC0ySpd_BRZIrz8ts8zhOwRb6YG9vkR000", "2", false, new Runnable(){
			public void run(){
				buildUi();
			}
		});
		
		//add items to panels for UI organization
		
	}
	
	private void buildUi(){
		//Open a map centered on Cawker City, KS USA
		LatLng cawkerCity = LatLng.newInstance(39.509,  -98.434);
		
		final MapWidget map = new MapWidget(cawkerCity, 2);
		map.setSize("50%", "50%");
		//Add some controls for the zoom level
		map.addControl(new LargeMapControl());
		
		//Add a marker
		map.addOverlay(new Marker(cawkerCity));
		
		//Add an info window to highlight a point of interest
		map.getInfoWindow().open(map.getCenter(),
				new InfoWindowContent("World's Largest Ball of Sisal Twine"));
		
		final DockLayoutPanel dock = new DockLayoutPanel(Unit.PX);
		dock.addNorth(map, 500);
		
		//Add the map to the HTML host page
		RootLayoutPanel.get().add(dock);
		
		//add to addPanel
		//TODO: figure out how to to add the map widget to panel
		//addPanel.add(map);
		
	}
}
