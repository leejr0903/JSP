package kr.co.leejr.encode;

/**
 * Numeric Character 암호화/복호화
 * 
 * @author leejr
 *
 */

public class NumericCharacterReference {

	
	/**
	 * Numeric Character 복호화
	 * 
	 * @param str
	 * @return The decoded String
	 */
	public static String decode(String str) {
		StringBuffer sb = new StringBuffer();
		int i1 = 0;
		int i2 = 0;

		while (i2 < str.length()) {
			i1 = str.indexOf("&#", i2);
			if (i1 == -1) {
				sb.append(str.substring(i2));
				break;
			}
			sb.append(str.substring(i2, i1));
			i2 = str.indexOf(";", i1);
			if (i2 == -1) {
				sb.append(str.substring(i1));
				break;
			}

			String tok = str.substring(i1 + 2, i2);
			try {
				int radix = 10;
				if (tok.charAt(0) == 'x' || tok.charAt(0) == 'X') {
					radix = 16;
					tok = tok.substring(1);
				}
				sb.append((char) Integer.parseInt(tok, radix));
			} catch (NumberFormatException exp) {
				sb.append(str);
			}
			i2++;
		}
		return sb.toString();
	}

	/**
	 * Numeric Character 복호화
	 * 
	 * @param str
	 * @return The encoded String
	 */
	public static String encode(String str) {
		char[] ch = str.toCharArray();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < ch.length; i++) {
			if (ch[i] < 0x20 || ch[i] > 0x7f)
				sb.append("&#").append((int) ch[i]).append(";");
			else
				sb.append(ch[i]);
		}
		return sb.toString();
	}
	
	/**
	 * Numeric 인코더/디코더 테스트
	 */
	
	public static void main(String[] args){
		String _str = decode("&#50629; &#49324;&#50629;");
		System.out.println(_str);
	}
}
