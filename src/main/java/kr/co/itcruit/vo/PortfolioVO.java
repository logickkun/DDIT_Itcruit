package kr.co.itcruit.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/**
 * 이력서-포트폴리오
 * @author 김나혜
 *
 */
@Data
public class PortfolioVO {
	private int portNo;				        //포트폴리오 번호
	private String rsmNo;				        //이력서번호(fk)
	private String portUrlTtl; 		        //포트폴리오 url 제목
	private String portUrl;			        //포트폴리오 url
	
	private String portFileTtl; 	        //포트폴리오 파일 제목 -> 테이블에서 삭제(240426)
	
	private MultipartFile[] rsmPortFile;
	private List<PortfolioFileVO> portFileVOList;
	
	
	public void setRsmPortFile(MultipartFile[] rsmPortFile) {
		
		this.rsmPortFile = rsmPortFile;
		
		if(rsmPortFile != null) {
			
			List<PortfolioFileVO> portFileList = new ArrayList<PortfolioFileVO>();
			
			for(MultipartFile portFile : rsmPortFile) {
				if(StringUtils.isBlank(portFile.getOriginalFilename())) {
					continue;
				}
				
				PortfolioFileVO portfolioFileVO = new PortfolioFileVO(portFile);
				portFileList.add(portfolioFileVO);
			}
			this.portFileVOList = portFileList;
		}
	}
	
	
}
