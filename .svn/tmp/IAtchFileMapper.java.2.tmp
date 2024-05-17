package kr.co.itcruit.mapper;

import org.apache.ibatis.annotations.Param;

import kr.co.itcruit.vo.AtchFileVO;

public interface IAtchFileMapper {

	public void atchFileInsert(AtchFileVO afv);

	public AtchFileVO getFileInfo(@Param("fileSrcNo") String fileSrcNo, @Param("orgnCmmncd") String orgnCmmncd);

	public AtchFileVO selectFile(@Param("fileSrcNo") String fileSrcNo, @Param("orgnCmmncd") String orgnCmmncd);

	public void atchFileDelete(AtchFileVO afv);

}
