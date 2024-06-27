package util;

import java.util.Random;

import org.springframework.stereotype.Controller;

@Controller
public class RandomCode {
	private int[] randomInt = new int[61];
	
	//randomInt에 값 넣기
	private RandomCode() {
		int num = 48;
		for(int i = 0; i < randomInt.length; i++) {
			if(num == 58) {
				num = 65;
			}
			if(num == 90) {
				num = 97;
			}
			randomInt[i] = num;
			num++;
		}
	}
	
	//랜덤문자 만들기
	public String randomCode() {
		String returnCode = "";
		Random rd = new Random();
		for(int i = 0; i < 20; i++) {
			returnCode += (char)randomInt[rd.nextInt(61)];
		}
		return returnCode;
	}
}
