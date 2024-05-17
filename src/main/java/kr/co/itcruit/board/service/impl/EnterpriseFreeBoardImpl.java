package kr.co.itcruit.board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.board.service.IEnterpriseFreeBoardService;
import kr.co.itcruit.mapper.IEnterpriseBoardMapper;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardCommentVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MidPaginationVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EnterpriseFreeBoardImpl implements IEnterpriseFreeBoardService {
	
	@Inject
	private IEnterpriseBoardMapper enterpriseBoardMapper;
	
//	@Override
//	public BoardVO list(int entNo) {
//		return enterpriseBoardMapper.list(entNo);
//	}
	
	@Override
	public EnterpriseVO selectEnt(int entNo) {
		return enterpriseBoardMapper.selectEnt(entNo);
	}

	@Override
	public int selectEntBoardCount(MidPaginationVO<BoardVO> pagingVO) {
		return enterpriseBoardMapper.selectEntBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectEntBoardList(MidPaginationVO<BoardVO> pagingVO) {
		return enterpriseBoardMapper.selectEntBoardList(pagingVO);
	}
	
	@Override
	public List<BoardVO> selectEntFreeBoardList(MidPaginationVO<BoardVO> pagingVO) {
		return enterpriseBoardMapper.selectEntFreeBoardList(pagingVO);
	}

	@Override
	public ServiceResult insert(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		int status = enterpriseBoardMapper.insert(boardVO);
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
					atchVO.setOrgnCmmncd("BBS202");
					atchVO.setFilePath(saveLocate);
					enterpriseBoardMapper.insertFile(atchVO);
					
					File saveFile = new File(saveLocate);
					atchVO.getItem().transferTo(saveFile);
				}
			}
		}
	}

	@Override
	public BoardVO detail(BoardVO bvo) {
		BoardVO boardVO = new BoardVO();
		enterpriseBoardMapper.incrementHit(bvo);
		boardVO = enterpriseBoardMapper.detail(bvo);
		return boardVO;
	}

	@Override
	public ServiceResult update(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		int status = enterpriseBoardMapper.update(boardVO);
		if(status > 0) {
			List<AtchVO> authFileList = boardVO.getAtchFileList();
			
			try {
				authFileUpload(authFileList, boardVO.getBbsNo(), req);
				
				Integer[] delBoardNo = boardVO.getDelBoardNo();
				if(delBoardNo != null) {
					for(int i=0; i<delBoardNo.length; i++) {
						AtchVO atchVO = enterpriseBoardMapper.selectBoardFile(delBoardNo[i]);
						enterpriseBoardMapper.deleteBoardFileList(delBoardNo[i]);
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
		
		BoardVO boardVO = enterpriseBoardMapper.detail(bvo);
		enterpriseBoardMapper.deleteBoardFile(bvo);
		int status = enterpriseBoardMapper.delete(bvo);
		if(status > 0) {
			List<AtchVO> atchFileList = boardVO.getAtchFileList();
			
			try {
				if(atchFileList != null && atchFileList.size() != 0) {
					String[] filePath = atchFileList.get(0).getFilePath().split("/");
					String path = filePath[0];
					deleteFolder(req, path);
					
				}else {
					//혹은 널일수도있고 혹은 size0 일수도있고 
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

	

	

	

}
