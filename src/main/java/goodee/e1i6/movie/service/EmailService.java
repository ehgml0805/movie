package goodee.e1i6.movie.service;

import java.util.UUID;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmailService {
	private final JavaMailSender javaMailSender;
	
	public EmailService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void sendEmail(String recipientAddress) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(recipientAddress);
		message.setSubject("시사회 이벤트에 당첨되셨습니다!");
		String uuid = UUID.randomUUID().toString().substring(0, 16);
		message.setText("축하합니다 당신은 시사회 이벤트에 당첨되었습니다 극장에가서 코드와 신분증을 제시해주세요 " + uuid);
		javaMailSender.send(message);
	}
}
