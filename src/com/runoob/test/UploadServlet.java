package com.runoob.test;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 上传文件存储路径
	private static final String UPLOAD_PATH = "uploads";

	// 上传参数配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 如果不是则停止
			PrintWriter responseWriter = response.getWriter();
			responseWriter.println("错误：非multipart/form-data上传");
			responseWriter.println("<br/>");
			responseWriter.flush();
			return;
		}

		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		// 存储在内存里的最大文件大小
		fileItemFactory.setSizeThreshold(MEMORY_THRESHOLD);
		// 超过最大文件大小后存储的临时文件
		fileItemFactory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

		// 最大文件大小
		fileUpload.setFileSizeMax(MAX_FILE_SIZE);
		// 最大请求大小，包含文件和表单数据
		fileUpload.setSizeMax(MAX_REQUEST_SIZE);
		// 中文处理
		fileUpload.setHeaderEncoding("UTF-8");

		// 文件上传后存储在当前目录下
		String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_PATH;

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		// 解析请求中的文件
		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			if (fileItems != null && fileItems.size() > 0) {
				for (FileItem fileItem : fileItems) {
					// 忽略表单中其他数据
					if (!fileItem.isFormField()) {
						// 因为有些浏览器的文件名带有路径，所以要用File类处理
						String fileName = (new File(fileItem.getName())).getName();
						String filePath = uploadPath + File.separator + fileName;
						
						File storeFile = new File(filePath);
						System.out.println("文件保存：" + filePath);
						
						fileItem.write(storeFile);
						request.setAttribute("message", "文件上传成功");
					}
				}
			}

		} catch (Exception e) {
			request.setAttribute("message", "错误信息：" + e.getMessage());
		}
		
		getServletContext().getRequestDispatcher("/UploadCompleteMessage.jsp").forward(request, response);
	}

}
