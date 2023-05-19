package com.dodam.hotel;

import java.util.Random;

import org.junit.jupiter.api.Test;

public class MainTest {

	@Test
	public void randomTextGenerateTest() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 6; i++) { 
			int index = rnd.nextInt(3);
			switch (index) {
			case 0:
				key.append(((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				key.append(((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				break;
			}
		}
//		Assertions.assertEquals(null, null);
		
	}

}
