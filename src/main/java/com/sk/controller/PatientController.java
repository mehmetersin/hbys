package com.sk.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sk.model.Patient;
import com.sk.services.PatientService;

@Controller
@Transactional
@RequestMapping("/patient")
public class PatientController {
	
		@Autowired
	    PatientService patientService;
	
		
		@RequestMapping(method = RequestMethod.GET)
		public String printWelcome(Map<String,Object> model) {
	      
	        
		    Patient patient=new Patient();
	        model.put("patientForm", patient);
	        model.put("SehirlerListesi", patientService.getSehirList());
	     
			return "hasta-kayit";
		}
		
		@RequestMapping(value = "/kayitlihastalar",method = RequestMethod.GET)
		public String Hastalar(Map<String,Object> model) {
	      
		
	        model.put("HastaListesi", patientService.getPatientList());
	        model.put("patientForm", new Patient());
			return "hastalar";
		}
		 
		 @RequestMapping(value = "/search", method = RequestMethod.POST)
		    public String deneme(@ModelAttribute("patientForm") Patient patient){
			 	ModelAndView model = new ModelAndView("hastalar");
			  	String id = Integer.toString(patient.getDosya_no());
		        model.addObject("searchForm", patientService.getPatient(id));
		        return "redirect:../patient/hastadetay?id="+id;
		 }
		 
		 @RequestMapping(value = "/hastadetay")
		    public ModelAndView HastaDetay(@RequestParam String id){
			  	ModelAndView model = new ModelAndView("hasta-detay");
		        model.addObject("HastaDetay", patientService.getPatient(id));
		        return model;
		    }
		

		@RequestMapping(method = RequestMethod.POST)
	    public String save(@ModelAttribute("patientForm") Patient patient){
			patientService.insertData(patient);
	        return "redirect:patient";
	    }

		@RequestMapping(value = "/delete",method = RequestMethod.GET)
	    public String deleteUser(@RequestParam String id){
			patientService.deletePatient(id);
	        return "redirect:../patient/kayitlihastalar";
	    }
		
		 @RequestMapping(value = "/edit")
		    public ModelAndView editPerson(@RequestParam String id){
			  	ModelAndView model = new ModelAndView("hasta-edit");
		        Patient patient = patientService.getPatient(id); 
		        model.addObject("SehirlerListesi", patientService.getSehirList());
		        model.addObject("patientForm", patient);
		        return model;
		    }
		
		 @RequestMapping(value = "/update", method = RequestMethod.POST)
		    public String update(@ModelAttribute("patientForm") Patient patient) {	
			 int id = patient.getDosya_no();
			 patientService.updatePatient(patient);	        
		        return "redirect:../patient/hastadetay?id="+id;    
		    }
		  
	


}
