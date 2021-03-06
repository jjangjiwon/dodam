package com.dodam.persistence.board.missing;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.missing.BookmarkVo;
import com.dodam.domain.missing.ListParamDTO;
import com.dodam.domain.missing.MissingBoardListDTO;
import com.dodam.domain.missing.MissingBoardVo;
import com.dodam.domain.missing.MissingWriteDTO;
import com.dodam.domain.missing.ReadCntVo;
import com.dodam.domain.missing.RecommendVo;

@Repository
public class MissingBoardDAOImpl implements MissingBoardDAO {

	private static String ns = "com.dodam.mappers.MissingBoardMapper"; 
	
	@Inject
	private SqlSession ses;

	@Override
	public List<MissingBoardListDTO> selectMissingBoardList(ListParamDTO lpd) {
		System.out.println(lpd);
		return ses.selectList(ns + ".selectAll", lpd);
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
	public int selectCntPost(ListParamDTO lpd) {
		return ses.selectOne(ns + ".selectCntPost", lpd);
	}

	@Override
	public int updateReadCount(int no) {
		return ses.update(ns + ".updateReadCount", no);
	}

	@Override
	public Timestamp getLastReadTime(ReadCntVo ri) {
		return ses.selectOne(ns + ".selectReadHistory", ri);
	}

	@Override
	public int insertReadHistory(ReadCntVo ri) {
		return ses.insert(ns + ".insertReadHistory", ri);
	}

	@Override
	public int updateCategory(Map<String, Object> categoryInfo) {
		return ses.update(ns + ".updateCategory", categoryInfo);
	}

	@Override
	public int updateBookmark(int no) {
		return ses.update(ns + ".updateBookmark", no);
	}

	@Override
	public int insertBookmarkHistory(Map<String, Object> bookMap) {
		return ses.insert(ns + ".insertHistory", bookMap);
	}

	@Override
	public int updateUnbookmark(int no) {
		return ses.update(ns + ".updateUnbookmark", no);
	}
	
	@Override
	public int deleteBookmarkHistory(Map<String, Object> bookMap) {
		return ses.insert(ns + ".deleteHistory", bookMap);
	}

	@Override
	public int selectBookmarkCount(int no) {
		return ses.selectOne(ns + ".selectBookmarkCount", no);
	}

	@Override
	public BookmarkVo selectBookmark(Map<String, Object> bookMap) {
		return ses.selectOne(ns + ".selectBookmarkHistory", bookMap);
	}

	@Override
	public RecommendVo getMostBookAnimal(String userid) {
		return ses.selectOne(ns + ".selectRecommAnimal", userid);
	}

	@Override
	public List<MissingBoardListDTO> getRandomAnimal(Map<String, Object> map) {
		return ses.selectList(ns + ".selectRandom", map);
	}

	@Override
	public List<MissingBoardListDTO> getBookedAnimal(Map<String, Object> map) {
		return ses.selectList(ns + ".selectBookAnimal", map);
	}
}
