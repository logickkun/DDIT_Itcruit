package kr.co.itcruit.board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;


import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IFreeBoardService;
import kr.co.itcruit.mapper.IFreeBoardMapper;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.MidPaginationVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeBoardServiceImpl implements IFreeBoardService {

	@Inject
	private IFreeBoardMapper freeBoardMapper;
	
	@Override
	public ServiceResult insert(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		
		int status = freeBoardMapper.insert(boardVO);
		if(status > 0) {
			
			List<AtchVO> authFileList = boardVO.getAtchFileList();
			try {
				
				authFileUpload(authFileList, boardVO.getBbsNo(), req);
				
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}



	private void authFileUpload(List<AtchVO> authFileList, String bbsNo, HttpServletRequest req) throws Exception {
		String savePath = "/resources/freeBoard/";
		
		if(authFileList != null) {
			if(authFileList.size() > 0) {
				for(AtchVO atchVO : authFileList) {
					String saveName = UUID.randomUUID().toString();
					saveName += "_" + atchVO.getFileName();
					String saveLocate = req.getServletContext().getRealPath(savePath + bbsNo);
					File file = new File(saveLocate);
					if(!file.exists()) {
						file.mkdirs();
					}
					
					saveLocate += "/" + saveName;
					
					atchVO.setFileSrcNo(bbsNo);
					atchVO.setOrgnCmmncd("BBS101");
					atchVO.setFilePath(saveLocate);
					freeBoardMapper.insertFile(atchVO);
					
					File saveFile = new File(saveLocate);
					atchVO.getItem().transferTo(saveFile);
				}
			}
		}
	}

	
	/**
	 * @author SHR
	 * @param BoardVO
	 * 
	 */
	@Override
	public BoardVO detail(BoardVO bvo) {
		
		BoardVO boardVO = new BoardVO();
		freeBoardMapper.incrementHit(bvo);
		//여기서 null이 나온다
		boardVO = freeBoardMapper.detail(bvo);
		return boardVO;
	}

	@Override
	public int selectFreeBoardCount(MidPaginationVO<BoardVO> pagingVO) {
		return freeBoardMapper.selectFreeBoardCount(pagingVO);
	}



	@Override
	public List<BoardVO> selectFreeBoardList(MidPaginationVO<BoardVO> pagingVO) {
		return freeBoardMapper.selectFreeBoardList(pagingVO);
	}


	@Override
	public ServiceResult update(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		int status = freeBoardMapper.update(boardVO);
		if(status > 0) {
			List<AtchVO> authFileList = boardVO.getAtchFileList();
			
			try {
				authFileUpload(authFileList, boardVO.getBbsNo(), req);
				
				Integer[] delBoardNo = boardVO.getDelBoardNo();
				if(delBoardNo != null) {
					for(int i=0; i<delBoardNo.length; i++) {
						AtchVO atchVO = freeBoardMapper.selectBoardFile(delBoardNo[i]);
						freeBoardMapper.deleteBoardFileList(delBoardNo[i]);
						File file = new File(atchVO.getFilePath());
						file.delete();
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult delete(HttpServletRequest req, BoardVO bvo) {
		
		ServiceResult result = null;
		
		BoardVO boardVO = freeBoardMapper.detail(bvo);
		freeBoardMapper.deleteBoardFile(bvo);
		int status = freeBoardMapper.delete(bvo);
		if(status > 0) {
			List<AtchVO> atchFileList = boardVO.getAtchFileList();
			try {
				if(atchFileList != null) {
					String[] filePath = atchFileList.get(0).getFilePath().split("/");
					String path = filePath[0];
					deleteFolder(req, path);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}



	private void deleteFolder(HttpServletRequest req, String path) {
		File folder = new File(path);
		try {
			if(folder.exists()) {	// 경로가 존재한다면
				// 폴더 안에 있는 파일들의 목록을 가져온다.
				File[] folderFileList = folder.listFiles();
				
				for(int i = 0; i < folderFileList.length; i++) {
					if(folderFileList[i].isFile()) {	// 폴더 안의 있는 파일이 파일일때
						// 폴더 안에 팔일을 차례대로 삭제
						folderFileList[i].delete();
					}else {	// 폴더안의 있는 파일이 폴더일때
						// 폴더라면 재귀함수 호출(폴더안으로 들어갈수있도록)
						deleteFolder(req, folderFileList[i].getPath());
					}
				}
				folder.delete();	// 폴더 삭제
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public AtchVO download(int fileNo) {
		return freeBoardMapper.download(fileNo);
	}



	@Override
	public List<BoardVO> bestList() {
		return freeBoardMapper.bestList();
	}



	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO) {
		return freeBoardMapper.commentList(boardCommentVO);
	}



	@Override
	public ServiceResult insertReport(BoardReportVO boardReportVO) {
		ServiceResult result = null;
		int status = freeBoardMapper.insertReport(boardReportVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}



	@Override
	public List<BoardReportVO> adminfreeBoardReport(MidPaginationVO<BoardReportVO> pagingVO) {
		return freeBoardMapper.adminfreeBoardReport(pagingVO);
	}
	
	@Override
	public List<BoardReportVO> adminfreeBoardCommentReport(MidPaginationVO<BoardReportVO> pagingVO) {
		return freeBoardMapper.adminfreeBoardCommentReport(pagingVO);
	}



	@Override
	public ServiceResult adminFreeBoarddelete(HttpServletRequest req, BoardVO bvo, BoardReportVO boardReportVO) {
		ServiceResult result = null;
		
		BoardVO boardVO = freeBoardMapper.detail(bvo);
		freeBoardMapper.deleteBoardFile(bvo);
		freeBoardMapper.updatereportBbsNo(boardReportVO);
		int status = freeBoardMapper.delete(bvo);
		if(status > 0) {
			List<AtchVO> atchFileList = boardVO.getAtchFileList();
			try {
				if(atchFileList != null) {
					String[] filePath = atchFileList.get(0).getFilePath().split("/");
					String path = filePath[0];
					deleteFolder(req, path);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}



	@Override
	public ServiceResult adminFreeBoardCommentDelete(BoardReportVO boardReportVO) {
		ServiceResult result = null;
		
		freeBoardMapper.updatereportcmmtNo(boardReportVO);
		int status = freeBoardMapper.adminDeleteComment(boardReportVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}



	@Override
	public int selectFreeBoardReportCount(MidPaginationVO<BoardReportVO> pagingVO) {
		return freeBoardMapper.selectFreeBoardReportCount(pagingVO);
	}



	@Override
	public int selectFreeBoardCommentReportCount(MidPaginationVO<BoardReportVO> pagingVO) {
		return freeBoardMapper.selectFreeBoardCommentReportCount(pagingVO);
	}



	

}






	












