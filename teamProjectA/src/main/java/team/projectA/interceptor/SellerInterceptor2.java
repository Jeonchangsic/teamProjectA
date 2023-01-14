package team.projectA.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import team.projectA.vo.UserVO;

public class SellerInterceptor2 extends HandlerInterceptorAdapter{

	@Override
	 public boolean preHandle(HttpServletRequest req,
			    HttpServletResponse res, Object handler) throws Exception {
			  
			  HttpSession session = req.getSession();
			  UserVO obj = (UserVO)session.getAttribute("login");
			  PrintWriter out = res.getWriter();
			  if(obj.getLodging().equals("Y")|| obj.getLodging().equals("Waiting")){
				  res.setContentType("text/html; charset=UTF-8");
				  out.append("<script>alert('숙소는 한번만 등록 가능합니다.');location.href='"+req.getContextPath()+"/seller/sellerInfo.do';</script>");
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
