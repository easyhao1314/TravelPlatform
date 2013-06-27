package com.fenghuang.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author 鲍国浩
 * 
 *         日期 @2013-6-27
 * 
 *         描述：
 * 
 * 
 * 
 */
@Controller
public class FileUploadController {
	/**
	 * 写文件的缓存大小
	 */
	private static final int BUFFER_SIZE = 2 * 1024;
	/**
	 * 限制文件大小
	 */
	private static final int UPLOAD_SIZE_THRESHOLD = 1024 * 1024 * 100;

	@RequestMapping("fenghuang/uploadFile.do")
	@ResponseBody
	public String uploadFile(HttpServletRequest request,
			HttpServletResponse response) {
		String filename = null;
		int chunk = 0;// 当前正在处理的文件分块序号
		int chunks = 0;// 分块上传总数
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 判断当前表单是否为"multipart/form-data"
		String dstPath = request.getServletContext().getRealPath("/fileUpload");
		if (isMultipart) {
			// ServletFileUpload upload = new ServletFileUpload();
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// factory.setSizeThreshold(1024 * 1024 * 10);
				factory.setSizeThreshold(UPLOAD_SIZE_THRESHOLD);
				//这里也可以下临时目录
				// factory.setRepository(new File("."));
				
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

						// 保存文件绝对路径
						String fullPath = dstPath + "/" + filename;
						if (chunk == 0) {
							File file = new File(fullPath);
							if (file.exists()) {
								file.delete();
							}
							// 上传文件
							File dst = new File(fullPath);
							this.saveUploadFile(input, dst);
						}
						if (chunk > 0) {
							// 追加文件

						}
						if (chunk + 1 == chunks || chunks == 0) {
							break;
						}
					}
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
