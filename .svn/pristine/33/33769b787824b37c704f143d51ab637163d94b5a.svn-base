package kr.co.itcruit.vo;

import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PortfolioFileVO {
	
	private String rsmNo;						//이력서번호
	private String portFileNo;					//포트폴리오 파일 번호
	private String portFileTtl; 	        //포트폴리오 파일 제목
	
	private MultipartFile portFile;
	
	private List<String> portFileTtlList;	//포트폴리오 파일 제목들. jsp->서버로 보낼 때 받을 배열
	
	private MultipartFile portnamefile;
	private int fileNo;						//파일 번호
	private int portNo;						
	
	private String fileName;				//파일이름
	private long fileSize;					//파일크기
	private String fileFancysize;			//파일팬시사이즈
	private String fileMime;				//파일타입
	private String fileSavepath;			//저장위치
	private int fileDowncount;
	
	public PortfolioFileVO() {}
	
	public PortfolioFileVO(MultipartFile portFile) {
		this.portFile = portFile;
		this.fileName = portFile.getOriginalFilename();
		this.fileSize = portFile.getSize();
		this.fileMime = portFile.getContentType();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);
	}
}
