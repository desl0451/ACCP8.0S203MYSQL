package cn.jbit.cms.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class FileIO {

	// 读取字符串信息
	public String readFile(String path) {
		FileReader fr = null;
		BufferedReader br = null;
		String line = "";
		StringBuffer sb = new StringBuffer();
		try {
			fr = new FileReader(path);
			br = new BufferedReader(fr);
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	/*
	 * 写入网页中
	 */
	public void writeFile(String path, String str) {
		FileWriter fr = null;
		BufferedWriter bw = null;
		try {
			fr = new FileWriter(path);
			bw = new BufferedWriter(fr);
			bw.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				bw.close();
				fr.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
