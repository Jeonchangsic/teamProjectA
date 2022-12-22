package team.projectA.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import team.projectA.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	 public boolean preHandle(HttpServletRequest req,
			    HttpServletResponse res, Object handler) throws Exception {
			  
			  HttpSession session = req.getSession();
			  Object obj = session.getAttribute("login");
			  PrintWriter out = res.getWriter();
			  if(obj == null) {
				  res.setContentType("text/html; charset=UTF-8");
				  out.append("<script>alert('로그인이 필요한 서비스입니다.');location.href='"+req.getContextPath()+"/login/login.do';</script>");
				  out.flush();
				  out.close();
				  /*res.sendRedirect("/A/login/login.do");*/
				   return false;
				  }
				  return true;
				 }
	   @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {

	        super.postHandle(request, response, handler, modelAndView);
	    }
	 
	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	            throws Exception {

	        super.afterCompletion(request, response, handler, ex);
	    }
}
