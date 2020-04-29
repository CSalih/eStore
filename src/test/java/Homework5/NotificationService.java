package Homework5;


class NotificationException extends Exception {
    public NotificationException(String message) {
        super(message);
    }
}

public class NotificationService {
    private IEmailService emailService;
    private ISMSService smsService;
    private ILoggingService loggingService;

    public NotificationService(IEmailService emailService, ISMSService smsService, ILoggingService loggingService) {
        this.emailService = emailService;
        this.smsService = smsService;
        this.loggingService = loggingService;
    }

    public void notifyAbout(Message message) throws NotificationException {
        try {
            // - send email
            boolean emailSend = emailService.sendEmail(message.text, message.sender.email);
            if (!emailSend) {
                // - send SMS if email does not work (sendEmail returns false)
                smsService.sendSMS(message.text, message.sender.phoneNumber);
            }
        } catch (Exception e) {
            // - if exceptions occurs, log information about exception
            loggingService.log(e.getMessage(), "sendEmail");
            boolean smsSend = smsService.sendSMS(message.text, message.sender.phoneNumber);
            if (!smsSend) {
                loggingService.log("Can't send SMS.", "sendSms");
                throw new NotificationException("Recipient could not be notified.");
            }
        }

    }
}

interface IEmailService {
    Boolean sendEmail(String text, String toEmail) throws NotificationException;
}
interface ISMSService {
    Boolean sendSMS(String text, String phoneNumber);
}
interface ILoggingService {
    Boolean log(String text, String module);
}

class Message{
    public String text;
    public Recipient sender;
}

class Recipient{
    public String email;
    public String phoneNumber;
}