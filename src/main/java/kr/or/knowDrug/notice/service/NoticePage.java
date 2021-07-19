package kr.or.knowDrug.notice.service;

import java.util.List;

import kr.or.knowDrug.board.vo.BoardVO;
import kr.or.knowDrug.notice.vo.NoticeVO;

public class NoticePage {
	private int total; // 전체글개수
	private int currentPage; // 현재 페이지번호
	private List<NoticeVO> content;
	private int totalPages; // 전체 페이지수
	private int startPage; // 페이지 시작번호[1]
	private int endPage; // 페이지 종료번호..[5]

	public NoticePage(int total, int currentPage, int size, List<NoticeVO> content) {
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<NoticeVO> getContent() {
		return content;
	}

	public void setContent(List<NoticeVO> content) {
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
