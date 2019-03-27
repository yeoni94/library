package com.library.util;

import java.util.Random;

public class passwordGenerator {
  
	 public static String getRandomPassword(int length) {
		 char[] characters = 
			 {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
		 StringBuilder sb = new StringBuilder("");
		 Random rn = new Random();
		 for(int i=0; i< length; i++) {
			 sb.append(characters[rn.nextInt(characters.length)]);
		 }
		 return sb.toString();
	 }
}
