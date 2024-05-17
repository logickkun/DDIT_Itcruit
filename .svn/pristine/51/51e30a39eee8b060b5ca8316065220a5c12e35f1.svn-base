package kr.co.itcruit.vo;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AtchVO {
	
	 private MultipartFile item;
	 private int fileNo;				// 파일 번호
	 private String fileSrcNo;			// 출처 글 번호
	 private String orgnCmmncd;			// 출처 코드
	 private String filePath;			// 저장위치
	 private long fileSize;				// 파일크기
	 private String fileFancysize;		// 파일팬시사이즈
	 private String fileMime;			// 파일타입
	 private String fileName;			// 파일이름
	 private String bbsNo;
	 
	 private String accountId; 
	 private String authCmmncd;			// 계정권한
	 private String accountSttsCmmncd;	// 계정상태
	 
	 private int entNo;	// 기업 번호
	 private String entNm;	// 기업 이름
	 
	 
	 public AtchVO() {}
	 
	 public AtchVO(MultipartFile item) {
		 this.item = item;
		 this.fileName = item.getOriginalFilename();
		 this.fileSize = item.getSize();
		 this.fileMime = item.getContentType();
		 this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);
	 }

}











