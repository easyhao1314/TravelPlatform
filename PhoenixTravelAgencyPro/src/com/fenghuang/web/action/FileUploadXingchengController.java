/**
 * 
 */
package com.fenghuang.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.PicManage;
import com.fenghuang.entiey.Richeng;
import com.fenghuang.service.IPicManageService;
import com.fenghuang.service.IRichengService;
import com.fenghuang.util.ExportDocImpl;
import com.fenghuang.util.Pagination;

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
@Controller
public class FileUploadXingchengController {
	@Autowired
	IRichengService ir;
	/**
	 * 写文件的缓存大小
	 */
	private static final int BUFFER_SIZE = 2 * 1024;
	/**
	 * 限制文件大小
	 */
	private static final int UPLOAD_SIZE_THRESHOLD = 1024 * 1024 * 100;
	
	@RequestMapping("fenghuang/uploadFileXingcheng.do")
	@ResponseBody
	public String uploadFile(HttpServletRequest request,
			HttpServletResponse response,String xianid) {
		/**
		 * 查询线路
		 */
		System.out.println(xianid);
		
		String richenganpai = "";
		String zao ="";
		String zhong ="";
		String wan ="";
		String jiaotongchengshi = "";
		String jiudian ="";
		String huodong="";
		
		String filename = null;
		int chunk = 0;// 当前正在处理的文件分块序号
		int chunks = 0;// 分块上传总数
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 判断当前表单是否为"multipart/form-data"
		String dstPath = request.getServletContext().getRealPath("/fileUpload/xingcheng");
		if (isMultipart) {
			// ServletFileUpload upload = new ServletFileUpload();
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// factory.setSizeThreshold(1024 * 1024 * 10);
				factory.setSizeThreshold(UPLOAD_SIZE_THRESHOLD);
				//这里也可以下临时目录
				// factory.setRepository(new File("."));
				Richeng ri;
				List<Richeng> l = new ArrayList<Richeng>();
				ServletFileUpload upload = new ServletFileUpload(factory);
				FileItemIterator iter = upload.getItemIterator(request);
				while (iter.hasNext()) {
					FileItemStream item = iter.next();
					String name = item.getFieldName();
					InputStream input = item.openStream();

					if ("chunk".equals(name)) {
						chunk = Integer.valueOf(Streams.asString(input));
						continue;
					}
					if ("chunks".equals(name)) {
						chunks = Integer.valueOf(Streams.asString(input));
						continue;
					}
					if (!item.isFormField()) {
						// 文件名
						filename = item.getName();
						// 保存文件目录绝对路径
						File dir = new File(dstPath);
						if (!dir.isDirectory() || !dir.exists()) {
							dir.mkdir();
						}
						String tempFileName = String.valueOf(System.currentTimeMillis());
						// 保存文件绝对路径
						String extName = filename.substring(filename.indexOf("."),filename.length());
						String fullPath = dstPath + "/" + tempFileName+extName;
						if (chunk == 0) {
							File file = new File(fullPath);
							if (file.exists()) {
								file.delete();
							}
							// 上传文件
							File dst = new File(fullPath);
							this.saveUploadFile(input, dst);
							//在这里做分析word的操作。
							ExportDocImpl edi = new ExportDocImpl();
							 TableIterator it = edi.readWord(fullPath);
					         int count=0;
					           //迭代文档中的表格  
					            while (it.hasNext()) {     
					            	int lie = 0;//区分表格
					                Table tb = (Table) it.next();     
					                //迭代行，默认从0开始  
					                if(count==0){
					                for (int i = 0; i < tb.numRows(); i++) {     
					                	if(count==0 && i==0){
					                		continue;
					                	}
					                	
					                	
					                	//这是每一行要处理的操作。
					                    TableRow tr = tb.getRow(i);   
					                    System.out.println("共"+tr.numCells()+"列");
					                    
					                    if(lie==0){
					                    	System.out.println("获得第一行数据");
					                    	//迭代列，默认从0开始  
						                    for (int j = 0; j < tr.numCells(); j++) {     
						                        TableCell td = tr.getCell(j);//取得单元格  
						                        //取得单元格的内容  
						                        String s ="";
						                        switch (j) {
												case 1:
												    for(int k=0;k<td.numParagraphs();k++){     
							                            Paragraph para =td.getParagraph(k);
							                            //以下是获取的文字内容
							                            s+=para.text().trim(); 
							                
							                        } //end for 
												    System.out.println("第二列"+s.trim());
												    huodong = s.trim();
													break;
												} 
						                    
						                    }   //end for
					                    	
					                    }
					                    if(lie==1){
					                    	System.out.println("获得第二行数据");
					                    	//迭代列，默认从0开始  
						                    for (int j = 0; j < tr.numCells(); j++) {     
						                        TableCell td = tr.getCell(j);//取得单元格  
						                        //取得单元格的内容  
						                        String s ="";
						                        switch (j) {
												case 1:
												    for(int k=0;k<td.numParagraphs();k++){     
							                            Paragraph para =td.getParagraph(k);
							                            //以下是获取的文字内容
							                            s+=para.text().trim(); 
							                
							                        } //end for 
												    System.out.println("第二列:"+s.trim());
													 richenganpai = s.trim();
													break;
												} 
						                    
						                    }   //end for
					                    	
					                    }
					                    if(lie==2){
					                    	//迭代列，默认从0开始  
						                    for (int j = 0; j < tr.numCells(); j++) {     
						                        TableCell td = tr.getCell(j);//取得单元格  
						                        //取得单元格的内容  
						                        String s ="";
						                        switch (j) {
												case 1:
												    for(int k=0;k<td.numParagraphs();k++){     
							                            Paragraph para =td.getParagraph(k);
							                            //以下是获取的文字内容
							                            s+=para.text().trim(); 
							                
							                        } //end for 
												    System.out.println("第二列:"+s.trim());
													 zao = s.trim();
													break;
												case 2:
												    for(int k=0;k<td.numParagraphs();k++){     
							                            Paragraph para =td.getParagraph(k);
							                            //以下是获取的文字内容
							                            s+=para.text().trim(); 
							                
							                        } //end for 
												    System.out.println("第三列:"+s.trim());
													 zhong = s.trim();
													break;
												case 3:
												    for(int k=0;k<td.numParagraphs();k++){     
							                            Paragraph para =td.getParagraph(k);
							                            //以下是获取的文字内容
							                            s+=para.text().trim(); 
							                
							                        } //end for 
												    System.out.println("第四列:"+s.trim());
													 wan = s.trim();
													break;
												case 4:
												    for(int k=0;k<td.numParagraphs();k++){     
							                            Paragraph para =td.getParagraph(k);
							                            //以下是获取的文字内容
							                            s+=para.text().trim(); 
							                
							                        } //end for 
												    System.out.println(s.trim()+"第二列");
													 jiudian = s.trim();
													break;
												} 
						                    
						                    }   //end for
					                    	System.out.println("获得第三行数据");
					                    	
					                    	
					                    }
					                    lie++;
					                    if(lie>2){
					                    	ri = new Richeng();
					                    	ri.setJiaotongchengshi(jiaotongchengshi);
					                    	ri.setRichenganpai(richenganpai);
					                    	ri.setHuodong(huodong);
					                    	ri.setZao(zao);
					                    	ri.setZhong(zhong);
					                    	ri.setWan(wan);
					                    	ri.setXianluid(Long.parseLong(xianid));
					                    	l.add(ri);
					                    	lie=0;
					                    	System.out.println(l.get(0).getRichenganpai());
					                    	continue;
					                    }
					                    
					                    
					                    
					                
					                    
					                }   //end for 
					            	
					              
					            } //end while 
					                count++;
					            }
						}
						if (chunk > 0) {
							// 追加文件

						}
						if (chunk + 1 == chunks || chunks == 0) {
							break;
						}
					}
				}
				System.out.println(l.size()+"SIZI");
				for (int i = 0; i < l.size(); i++) {
					ir.insert(l.get(i));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "";

	}

	private void saveUploadFile(InputStream input, File dst) {
		InputStream in = null;
		OutputStream out = null;
		try {
			if (dst.exists()) {
				out = new BufferedOutputStream(new FileOutputStream(dst, true),
						BUFFER_SIZE);
			} else {
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
			}
			in = new BufferedInputStream(input, BUFFER_SIZE);

			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
