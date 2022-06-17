package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.result;

import question.upload.excelsheet.resultPdf;

/**
 * Servlet implementation class result_pdfController
 */
@WebServlet("/result_pdfController")
public class result_pdfController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public result_pdfController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		ServletContext sc=request.getServletContext();

		List<result> rlist=(List<result>)session.getAttribute("resultList");
		if(rlist!=null)
		{
			PrintWriter pw=response.getWriter();
			String path=sc.getRealPath("/"+"pdf");
			String filename="pdf_result.pdf";
			resultPdf rp=new resultPdf();
			rp.generatePdf(path,rlist);
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");  
			FileInputStream fis=new FileInputStream(path+File.separator+filename);
			int i;
			while((i=fis.read())!=-1)
			{
				pw.write(i);
			}
			fis.close();
			pw.close();
		}
		else
		{
			System.out.println("list is null"
					+ "");
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
