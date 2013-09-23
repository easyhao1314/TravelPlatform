/**
 * 
 */
package com.fenghuang.util;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-9-23
 *
 * 描述 ：
 *
 *
 */

import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
  
import org.apache.poi.hwpf.HWPFDocument;  
import org.apache.poi.hwpf.usermodel.Paragraph;  
import org.apache.poi.hwpf.usermodel.Range;  
import org.apache.poi.hwpf.usermodel.Table;  
import org.apache.poi.hwpf.usermodel.TableCell;  
import org.apache.poi.hwpf.usermodel.TableIterator;  
import org.apache.poi.hwpf.usermodel.TableRow;  
  
import java.io.File;     
import java.io.FileInputStream;     
import java.io.InputStream;     
    
import org.apache.poi.POIXMLDocument;     
import org.apache.poi.POIXMLTextExtractor;     
import org.apache.poi.hwpf.extractor.WordExtractor;     
import org.apache.poi.openxml4j.opc.OPCPackage;     
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;    
  
  
import org.apache.poi.poifs.filesystem.POIFSFileSystem;  
  
public class ExportDocImpl  
{  
    public TableIterator readWord(String filePath){  
        try{  
            FileInputStream in = new FileInputStream(filePath);//载入文档  
           POIFSFileSystem pfs = new POIFSFileSystem(in);     
            HWPFDocument hwpf = new HWPFDocument(pfs);     
            Range range = hwpf.getRange();//得到文档的读取范围 
            TableIterator it = new TableIterator(range);  
            return it; 
        }catch(Exception e){  
            e.printStackTrace();  
        }  
        return null;
    }//end method  
    public static void main(String[] args) {
//    	ExportDocImpl edi = new ExportDocImpl();
//    	edi.Word();
	}
}  
