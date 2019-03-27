package com.library.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileGenerator {

	public static boolean saveBookImg(MultipartFile multipartFile, String name){
		boolean result = true;
		
		String destination = "src/main/resources/static/img/book/";
		
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.indexOf("."));
		
		String rename = name+extension;
		String fullPath = destination+rename;
		
		if(!multipartFile.isEmpty()) {
			try {
				byte[] bytes = multipartFile.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
				stream.write(bytes);
				stream.close();
				result = true;
			}catch(Exception e) {
				e.printStackTrace();
				result = false;
			}
		}
		
		return result;
	}
	
	public static void deleteBookImg(String name) {
		String fullPath = "src/main/resources/static/img/book/"+name+".jpg";
		File file = new File(fullPath);
		file.delete();
	}
}
