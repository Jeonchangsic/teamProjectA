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
	
	@ResponseBody   //���������ٵ�� data�� �������ִ� ��Ʈ�ѷ��� ����
	@RequestMapping(value="/auth/kakao/callback", method = RequestMethod.GET)
	public String kakaoLogin(String code) {
		
		//post������� key=value �����͸� īī���� ��û
		//������ ��û�� ���ִ� ���̺귯�� RestTemplate
		
		//HttpHeader ������Ʈ ����
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();      //head�� ����� ����
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody ������Ʈ ����
		MultiValueMap<String, String> params = new LinkedMultiValueMap();
		params.add("grant_type","authorization_code");
		params.add("client_id","8bb3c9d09631fc7a7f15a6de4cef3908");
		params.add("redirect_uri","http://localhost:8080/A/auth/kakao/callback");
		params.add("code",code); 
		
		//HttpHeader�� HttpBody�� �ϳ��� ������Ʈ�� ���
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity(params,headers);
		
		//Http ��û�ϱ� - post������� -  �׸��� response ������ �������.
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequest,
			String.class
		);
		return "��ū ��û �Ϸ�: ��ū ��û�� ���� ����:"+response;
	}
}
