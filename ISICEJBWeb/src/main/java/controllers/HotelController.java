package controllers;

import java.io.IOException;

import dao.HotelIDaoLocale;
import dao.VilleIDaoLocale;
import entities.Hotel;
import entities.Ville;
import jakarta.ejb.EJB;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HotelController
 */
public class HotelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private HotelIDaoLocale ejb;
	@EJB
	private VilleIDaoLocale vejb;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public HotelController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ville> villes=vejb.findAll();
		List<Hotel> hotels=ejb.findAll();
		request.setAttribute("villes", villes);
		request.setAttribute("hotels", hotels);
		RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
		dispatcher.forward(request, response);
		
	}
	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if("create".equals(action)){
			String nom = request.getParameter("nom");
			String adress = request.getParameter("adress");
			String telephone = request.getParameter("telephone");
			int villId=Integer.parseInt(request.getParameter("ville"));
			Ville ville=vejb.findById(villId);
			ejb.create(new Hotel(nom,adress,telephone,ville));
			request.setAttribute("hotels", ejb.findAll());
			request.setAttribute("villes", vejb.findAll());
			RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
			dispatcher.forward(request, response);
		}
		
		else if("edit".equals(action)) {
	        int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("Name");
	        String adresse = request.getParameter("Adresse");
	        String telephone = request.getParameter("Telephone");
	        int idVille = Integer.parseInt(request.getParameter("Ville"));
	        Ville ville=vejb.findById(idVille);
	        Hotel HotelToEdit = ejb.findById(id);
	        if (HotelToEdit != null) {
	        	HotelToEdit.setAdresse(adresse);
	        	HotelToEdit.setNom(name);
	        	HotelToEdit.setTelephone(telephone);
	        	HotelToEdit.setVille(ville);
	            ejb.update(HotelToEdit);
	        }
	        response.sendRedirect(request.getContextPath() + "/HotelController");
	    }
		else if ("delete".equals(action)) {
		    int hotelId = Integer.parseInt(request.getParameter("id"));
		    if(ejb.findById(hotelId)!=null) {
		    	Hotel Hoteldelete =  ejb.findById(hotelId);
		            ejb.delete(Hoteldelete);
		            boolean deleted = true;
		            if (deleted) {
		            	List<Hotel> hotels = ejb.findAll();	
		            	List<Ville> villes=vejb.findAll();
						request.setAttribute("hotels", hotels);
						request.setAttribute("villes", villes);
						request.getRequestDispatcher("hotel.jsp").forward(request, response);
		            }
		            else {
		                response.sendRedirect(request.getContextPath() + "HotelController?deleteFailed=true");
		            }
		        }
		    }
		}
	}

