package kr.co.leejr.pdf;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfWriter;

public class HelloPdf {

	public static void main(String[] args){
		try{
			Rectangle pageSize = new Rectangle(144,720);
			
			pageSize.setBackgroundColor(new java.awt.Color(0xFF,0xFF,0xDE));
			
			Document document = new Document(pageSize);
			
			// 아래 경로는 src 상위 폴더에 생성되네
			PdfWriter.getInstance(document, new FileOutputStream("HelloWorld.pdf"));
		
			document.open();
			
			document.add(new Paragraph("HelloWorld!!"));
			
			document.close();
			
			System.out.print("End");
		
		}catch(FileNotFoundException e){
			System.out.print("FileNotFoundException : " + e);
		}catch(DocumentException e){
			System.out.print("DocumentException : " + e);
		}
	}
}
