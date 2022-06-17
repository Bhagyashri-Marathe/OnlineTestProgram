package question.upload.excelsheet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.model.result;

public class resultPdf {
	
	public static void generatePdf(String path,List<result> rlist)
	{
		int userId=0;
		try {
			System.out.println("hello in generatePDF");
			String filename=path+File.separator+"pdf_result.pdf";
			System.out.println(filename);
			Document document=new Document();
			PdfWriter.getInstance(document, new FileOutputStream(filename));
			document.open();
			
			
			PdfPTable table=new PdfPTable(8);
			
			PdfPCell c1=new PdfPCell(new Phrase("userId"));
			table.addCell(c1);
			
			c1=new PdfPCell(new Phrase("userName"));
			table.addCell(c1);
			
			c1=new PdfPCell(new Phrase("examId"));
			table.addCell(c1);	
			
			c1=new PdfPCell(new Phrase("course"));
			table.addCell(c1);
			
			c1=new PdfPCell(new Phrase("obtained Marks"));
			table.addCell(c1);
			
			c1=new PdfPCell(new Phrase("incorrect questions"));
			table.addCell(c1);
			
			c1=new PdfPCell(new Phrase("Total Marks"));
			table.addCell(c1);
			
			c1=new PdfPCell(new Phrase("Status"));
			table.addCell(c1);
			
			table.setHeaderRows(1);
			
			Paragraph p2=new Paragraph("  TECHNOGENIX INSTITUTE  ");
			p2.setAlignment(Element.ALIGN_CENTER);
			document.add(p2);
			
			
			
			Paragraph p=new Paragraph("RESULT SHEET");
			p.setAlignment(Element.ALIGN_CENTER);
			document.add(p);
			
			table.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.setSpacingAfter(20);
			table.setSpacingBefore(20);
			table.setTotalWidth(20);
			for(result r:rlist)
			{
				userId=r.getUserId();
				System.out.println("welcome");
				table.addCell(new Paragraph(String.valueOf(r.getUserId())));
				table.addCell(new Paragraph(r.getUserName()));
				table.addCell(new Paragraph(String.valueOf(r.getExamId())));
				table.addCell(new Paragraph(r.getCourse()));
				table.addCell(new Paragraph(String.valueOf(r.getCorrect())));
				table.addCell(new Paragraph(String.valueOf(r.getIncorrect())));
				table.addCell(new Paragraph(String.valueOf(r.getTquestions())));
				table.addCell(new Paragraph(r.getResultStatus()));
				document.add(table);
			}
			System.out.println("thank you");
			document.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
