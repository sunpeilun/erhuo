package com.czxy.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Scanner;

import org.apache.commons.io.IOUtils;

public class MyFileUtils {

	/**
	 * 拷贝文件到目录
	 * 
	 * @param src
	 *            原文件
	 * @param destDir
	 *            目的文件
	 * @throws Exception
	 */
	public static void copyFile(File src, File destDir) throws Exception {
			BufferedInputStream bin = new BufferedInputStream(new FileInputStream(src));
			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(destDir));
			IOUtils.copy(bin, out);
			out.close();
			bin.close();
	}
	
	public static void copy(InputStream in, OutputStream out) throws IOException{
		byte[] buf = new byte[4096];
		int len = 0;
		while((len = in.read(buf)) != -1){
			out.write(buf, 0, len);
		}
	}

	public static void delTemp(String src, Integer uid) {
		File[] listFiles = new File(src).listFiles();
		for (File file : listFiles) {
			if(file.isFile()){
				String id = file.getName();
				id = id.substring(0, id.lastIndexOf("."));
				if(id.equals("" + id)){
					file.delete();
				}
			}
		}
		
	}
}
