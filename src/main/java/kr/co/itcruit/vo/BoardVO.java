package kr.co.itcruit.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	private String bbsNo;				// 게시글 번호
	private Date bbsRegDt;			// 작성일자
	private int bbsInqCnt;			// 조회수
	private String bbsTtl;			// 제목
	private String bbsCn;			// 내용
	private String bbsWriter;		// 작성자
	private String bbsCtgryCmmncd;	// 카테고리
	private String bbsDelyn;		// 게시판글 상태
	private String replyYn;			// 문의 답변여부
	private int bssCmntNo;		// 댓글 번호
	
	private String bssCmntCn; // 답변내용
	
	private int entNo;
	private String bizTypeNm;
	private String ksicNm;
	private String entNm;
	private byte[] entImg;

	private int fileNo;				// 파일 번호
	private String fileSrcNo;			// 출처 글 번호
	
	private String accountId; 			// 아이디 loginId
	private String accountNick;			// 닉네임
	
	private Integer[] delBoardNo;
	private List<AtchVO> atchFileList;
	private MultipartFile[] boFile;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AtchVO> atchFileList = new ArrayList<AtchVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AtchVO atchVO = new AtchVO(item);
				atchFileList.add(atchVO);
			}
			this.atchFileList = atchFileList;
		}
	}

	public BoardVO() {
		
	}

	public BoardVO(String bbsNo, String bbsCtgryCmmncd) {
		this.bbsNo = bbsNo;
		this.bbsCtgryCmmncd = bbsCtgryCmmncd;
	}

	public BoardVO(String bbsNo, int entNo) {
		super();
		this.bbsNo = bbsNo;
		this.entNo = entNo;
	}
	
	
	
	private int noticeEntCommentHit;	// 기업공지댓글 조회수
	private int freeEntCommentHit;		// 기업자유댓글 조회수
	
	
}

	


