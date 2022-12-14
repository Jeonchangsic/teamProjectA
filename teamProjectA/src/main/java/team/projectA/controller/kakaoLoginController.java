package team.projectA.controller;





import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;



/**
 * Handles requests for the application home page.
 */
@Controller
public class kakaoLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(kakaoLoginController.class);
	
	@ResponseBody   //리스폰스바디는 data를 리턴해주는 컨트롤러로 지정
	@RequestMapping(value="/auth/kakao/callback", method = RequestMethod.GET)
	public String kakaoLogin(String code) {
		
		//post방식으로 key=value 데이터를 카카오로 요청
		//데이터 요청을 해주는 라이브러리 RestTemplate
		
		//HttpHeader 오브젝트 생성
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();      //head를 만들기 위함
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap();
		params.add("grant_type","authorization_code");
		params.add("client_id","8bb3c9d09631fc7a7f15a6de4cef3908");
		params.add("redirect_uri","http://localhost:8080/A/auth/kakao/callback");
		params.add("code",code); 
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity(params,headers);
		
		//Http 요청하기 - post방식으로 -  그리고 response 변수의 응답받음.
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequest,
			String.class
		);
		return "토큰 요청 완료: 토큰 요청에 대한 응답:"+response;
	}
}