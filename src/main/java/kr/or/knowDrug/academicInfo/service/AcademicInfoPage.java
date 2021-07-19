package kr.or.knowDrug.academicInfo.service;

import java.util.List;

import kr.or.knowDrug.academicInfo.vo.AcademicInfoVO;

public class AcademicInfoPage {
	private int total; // 전체글개수
	private int currentPage; // 현재 페이지번호
	private List<AcademicInfoVO> content; // LprodVo 목록 데이터
	private int totalPages; // 전체 페이지수
	private int startPage; // 페이지 시작번호[1]
	private int endPage; // 페이지 종료번호..[5]

	public AcademicInfoPage(int total, int currentPage, int size, List<AcademicInfoVO> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;

		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else {
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++;
			}

			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;

			if(modVal == 0)
				startPage -= 5;

			endPage = startPage + 4;
			if (endPage > totalPages)
				endPage = totalPages; // [1][2][3]까지만 출력해줌.
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	//목록 겨로가가 없으면 전체 글 개수는 0이므로 true
	public boolean hasNoArticles() {
		return total == 0;
	}
   
	//목록 결과가 있으면 전체 글 개수가 0보다 크므로 true
	public boolean hasArticles() {
		return total > 0;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<AcademicInfoVO> getContent() {
		return content;
	}

	public void setContent(List<AcademicInfoVO> content) {
		this.content = content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}







}
