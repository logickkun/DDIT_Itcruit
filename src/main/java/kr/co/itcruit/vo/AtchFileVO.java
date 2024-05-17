package kr.co.itcruit.vo;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AtchFileVO {
	
	private int fileNo;
	private String fileSrcNo;
	private String orgnCmmncd;
	private String filePath;
	private long fileSize;
	private String fileFancysize;
	private String fileMime;
	private String fileName;
	
	public AtchFileVO() {}
	
	public AtchFileVO(MultipartFile file, HttpServletRequest req, String fileSrcNo, String orgnCmmncd) {
		
		
		StringBuilder saveName = new StringBuilder();
		saveName.append(UUID.randomUUID().toString());
		saveName.append("_");
		saveName.append(file.getOriginalFilename().replace(" ", ""));
		
		String savePath = "/resources/file/";
		
		this.fileSrcNo = fileSrcNo;
		this.orgnCmmncd = orgnCmmncd;
		
		String realPath = req.getServletContext().getRealPath(savePath + "/" + fileSrcNo);
		
		File filefolder = new File(realPath);
		
		if(!filefolder.exists()){

			filefolder.mkdirs();
			
		}
		
		
		File saveFile = new File(realPath, saveName.toString());
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		String filePath = realPath + File.separator + saveName.toString();
		
		this.filePath = filePath;
		this.fileSize = file.getSize();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(file.getSize());
		this.fileMime = file.getContentType();
		this.fileName = file.getOriginalFilename();
		
	}
	
}
