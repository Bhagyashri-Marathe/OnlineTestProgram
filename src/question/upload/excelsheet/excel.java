package question.upload.excelsheet;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.dao.questionDao;
import com.model.question;



public class excel {
	public static int record(String path,String course)
	{
		int correctOpt=0,i=0,quesId=0;
		String questionText=null,opt1=null,opt2=null,opt3=null,opt4=null;
		List<question> queslist=new LinkedList<question>();
		try  
		{  

			File file = new File(path);   //creating a new file instance  
			FileInputStream fis = new FileInputStream(file);   //obtaining bytes from the file  
			//creating Workbook instance that refers to .xlsx file  
			XSSFWorkbook wb = new XSSFWorkbook(fis);   
			XSSFSheet sheet = wb.getSheetAt(0);     //creating a Sheet object to retrieve object  
			Iterator<Row> itr = sheet.iterator();    //iterating over excel file  
			while (itr.hasNext())                 
			{  
				Row row = itr.next();  
				Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
				while (cellIterator.hasNext())   
				{  
					Cell cell = cellIterator.next(); 
					int columnIndex=cell.getColumnIndex();
					switch (columnIndex)               
					{  
					case 0:    //field that represents string cell type  
						questionText=cell.getStringCellValue();
						System.out.print(questionText+ "\t\t\t");  
						break;  
					case 1:    //field that represents number cell type  
						opt1=cell.getStringCellValue();
						System.out.print(opt1+ "\t\t\t");  
						break; 
					case 2:    //field that represents number cell type  
						opt2=cell.getStringCellValue();
						System.out.print(opt3+ "\t\t\t");  
						break;
					case 3:    //field that represents number cell type  
						opt3=cell.getStringCellValue();
						System.out.print(opt3+ "\t\t\t");  
						break;
					case 4:    //field that represents number cell type  
						opt4=cell.getStringCellValue();
						System.out.print(opt4+ "\t\t\t");  
						break;
					case 5:
						correctOpt=(int)cell.getNumericCellValue();
						System.out.print(correctOpt+ "\t\t\t"); 
					default:  
					}  
					System.out.println("before object loop");
				}
				ArrayList<Integer> list=new ArrayList<Integer>();
				for(i=1;i<5000;i++) {
					list.add(new Integer(i));
				}
				Collections.shuffle(list);
				for(i=1;i<=2000;i++) {
					quesId=list.get(i);
				}
				System.out.println("object");
				question qu=new question(quesId, questionText, opt1, opt2, opt3, opt4, correctOpt);
				queslist.add(qu);
				System.out.println("");  
			}  
		}  
		catch(Exception e)  
		{  
			e.printStackTrace();  
		}  
		//saveDao sd=new saveDao();
		//sd.addRecord(emplist);
		questionDao qd=new questionDao();
		int j=qd.addExcelQuestion(queslist, course);
		return j;
	}  


}
