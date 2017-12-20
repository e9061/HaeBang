package net.haebang.qna.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.haebang.qna.controller.CommonUtils;
import net.haebang.qna.dao.QnADAO;
import net.haebang.vo.QnAVo;

@Service
public class QnAServiceimpl implements QnAService{

	private static final String filePath = "/home/ubuntu/HaeBangQnA/";
	private final int LINE_PER_PAGE = 10;
	
	@Autowired
	QnADAO dao;
	
	@Override
	public List<QnAVo> selectAllBoard(int page) {
		
		int startPoint = page*LINE_PER_PAGE;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("startPoint", startPoint);
		map.put("row", LINE_PER_PAGE);
		
		System.out.println(map);
		
		List<QnAVo> list = dao.selectAll(map);
		
		return list;
	}

	@Override
	public void insertBoard(QnAVo QnA, MultipartHttpServletRequest request) {

		Iterator<String> iterator = request.getFileNames();
		// request가 가져온 파라미터 이름들을 iterator에 저장

		MultipartFile multipartFile = null;

		String oriName = null;
		String originalFileExtension = null;
		String saveName = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			System.out.println("12341234");
			
				multipartFile = request.getFile(iterator.next());
				if (multipartFile.isEmpty() == false) {

					oriName = multipartFile.getOriginalFilename();
					originalFileExtension = oriName.substring(oriName.lastIndexOf("."));
					saveName = CommonUtils.getRandomString() + originalFileExtension;

					file = new File(filePath + saveName);
					try {

						multipartFile.transferTo(file);

					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

					QnA.setQ_oriName(oriName);
					QnA.setQ_saveName(saveName);

				}
			}
			// System.out.println("-------------- file start --------------\n");
			// System.out.println("oriName : " + oriName);
			// System.out.println("saveName : " + saveName);
			// System.out.println("filename : " + multipartFile.getOriginalFilename());
			// System.out.println("size : " + multipartFile.getSize());
			// System.out.println("-------------- file end --------------\n");

		

		dao.insert(QnA);

	}

	@Override
	public void deleteBoard(int q_no) {
		dao.delete(q_no);
		
	}

	@Override
	public QnAVo selectOneBoard(int q_no) {
		System.out.println(q_no+"ser");
		return dao.selectOne(q_no);
	}

	@Override
	public void updateBoard(QnAVo QnA) {
		dao.update(QnA);
	}

	@Override
	public void updateViewCnt(int q_no) {
		dao.updateviewCnt(q_no);
	}

	@Override
	public int getLastPage() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int lastPage = (int)((double)dao.selectTotal(map)/LINE_PER_PAGE);
		
		
		return lastPage;
	}
	
	@Override
	public void insertFM(QnAVo QnA) {
		dao.insertFM(QnA);

	}

	@Override
	public void insertFE(QnAVo QnA) {
		dao.insertFE(QnA);

	}

	@Override
	public List<QnAVo> selectFM(int page) {
		int startPoint = page * LINE_PER_PAGE;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("startPoint", startPoint);
		map.put("row", LINE_PER_PAGE);

		System.out.println(map);

		List<QnAVo> list = dao.selectFM(map);

		return list;
	}

	@Override
	public List<QnAVo> selectFE(int page) {
		int startPoint = page * LINE_PER_PAGE;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("startPoint", startPoint);
		map.put("row", LINE_PER_PAGE);

		System.out.println(map);

		List<QnAVo> list = dao.selectFE(map);

		return list;
	}

	
	
}
