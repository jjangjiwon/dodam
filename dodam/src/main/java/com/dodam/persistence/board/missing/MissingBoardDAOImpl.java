package com.dodam.persistence.board.missing;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.PagingInfoDTO;

@Repository
public class MissingBoardDAOImpl implements MissingBoardDAO {

	private static String ns = "com.dodam.mappers.MissingBoardMapper"; 
	
	@Inject
	private SqlSession ses;

	@Override
	public List<MissingBoardListDTO> selectMissingBoardList(PagingInfoDTO pi) {
		System.out.println(pi);
		return ses.selectList(ns + ".selectAll", pi);
	}

	@Override
	public MissingBoardVo getMissingBoard(int no) {
		return ses.selectOne(ns + ".selectMissing", no);
	}

	@Override
	public int insertBoard(MissingWriteDTO mw) {
		return ses.insert(ns + ".insertMissing", mw);
	}

	@Override
	public int deleteBoard(int no) {
		return ses.delete(ns + ".deleteMissing", no);
	}

	@Override
	public int updateBoard(MissingWriteDTO mw) {
		System.out.println(mw);
		return ses.update(ns + ".updateMissing", mw);
	}

	@Override
	public int selectCntPost() {
		return ses.selectOne(ns + ".selectCntPost");
	}
}