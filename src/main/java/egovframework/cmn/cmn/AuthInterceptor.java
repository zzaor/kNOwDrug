package egovframework.cmn.cmn;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    @Override // 이부분은 컨트롤러 타기전에
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 세션 객체 생성
        HttpSession session = request.getSession();
        // 세션에 id가 null이면
        if(session.getAttribute("memId") == null) {
            // 로그인 페이지로 이동
//            response.sendRedirect("main.do");

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 후 이용바랍니다.'); location.href='main.do';</script>");
            out.flush();
            // 컨트롤러를 실행하지 않는다.(요청페이지로 이동하지 않는다)
            return false;

        // null이 아니면
        } else {
            // 컨트롤러를 실행(요청페이지로 이동한다.)
            return true;
        }
    }
    @Override // 이건 컨트롤러에서 뷰로 넘어가기 직전
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	HttpSession session = request.getSession();

    	 if(session.getAttribute("memId") != null) {
             // 로그인 페이지로 이동
    		 modelAndView.addObject("memId", session.getAttribute("memId"));
             // 컨트롤러를 실행하지 않는다.(요청페이지로 이동하지 않는다)
         }

    }
}