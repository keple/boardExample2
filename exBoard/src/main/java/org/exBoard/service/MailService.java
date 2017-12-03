package org.exBoard.service;

public interface MailService {
	public boolean sendMailToUser(String title,String text,String from, String to, String filePath);
}
