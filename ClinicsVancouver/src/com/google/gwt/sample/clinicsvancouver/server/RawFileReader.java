package com.google.gwt.sample.clinicsvancouver.server;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class RawFileReader {
	public  RawFileReader(){
		//TODO: remove after testing
		try {
			BufferedReader reader = new BufferedReader(new FileReader("/ClinicsVancouver/bin/hlbc_walkinclinics.txt"));
			
			String line = null;
			while ((line = reader.readLine()) != null) {
				System.out.println(line);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		}
	}
	
	
	
}
