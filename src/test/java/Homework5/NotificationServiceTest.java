package Homework5;

import org.easymock.*;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.easymock.EasyMock.expect;

@RunWith(EasyMockRunner.class)
public class NotificationServiceTest extends EasyMockSupport {

    private static Recipient recipient;
    private static Message message;

    @Mock
    private IEmailService emailService;
    @Mock
    private ISMSService smsService;
    @Mock
    private ILoggingService loggingService;

    @TestSubject
    private NotificationService notificationService = new NotificationService(
            emailService,
            smsService,
            loggingService
    );

    @BeforeClass
    public static void init() {
        recipient = new Recipient();
        recipient.email = "test@email.com";
        recipient.phoneNumber = "0000000000";
        message = new Message();
        message.sender = recipient;
        message.text = "Hello Test!";
    }

    /**
     * Wenn keine Email versendet werden konnte, wird eine SMS versendet. Vergewissern
     * Sie sich auch, dass die richtigen Daten an die sendXXX() Methoden übergeben
     * werden.
     */
    @Test
    public void sendSmsWhenEmailFailsTest() throws NotificationException {
        expect(emailService.sendEmail(message.text, recipient.email))
                .andReturn(false);
        expect(smsService.sendSMS(message.text, recipient.phoneNumber))
                .andReturn(true);
        replayAll();
        notificationService.notifyAbout(message);
        verifyAll();
    }

    /**
     * Wenn eine Email versendet werden konnte, wird keine SMS versendet und auch
     * nichts geloggt. Vergewissern Sie sich auch, dass die richtigen Daten an die sendXXX()
     * Methoden übergeben werden.
     */
    @Test
    public void sendEmailTest() throws NotificationException {
        expect(emailService.sendEmail(message.text, recipient.email))
                .andReturn(true);

        replayAll();
        notificationService.notifyAbout(message);
        verifyAll();
    }

    /**
     * Wenn eine Exception beim Emailversand auftritt, wird eine SMS versendet und die
     * Message der Exception geloggt.
     */
    @Test
    public void exceptionAfterSendEmailTest() throws NotificationException {
        String exceptionMessage = "Test Exception";

        expect(emailService.sendEmail(message.text, recipient.email))
                .andThrow(new NotificationException(exceptionMessage));
        expect(loggingService.log(exceptionMessage, "sendEmail"))
                .andReturn(true);
        expect(smsService.sendSMS(message.text, recipient.phoneNumber))
                .andReturn(true);

        replayAll();
        notificationService.notifyAbout(message);
        verifyAll();
    }


    /**
     * Wenn weder die Email noch die SMS versendet werden konnte, werden die Messages
     * beider Exceptions geloggt und eine neue Exception geworfen, die als Message
     * „Recipient could not be notified.“ enthält
     */
    @Test
    public void emailAndSmsFailedTest() throws NotificationException {
        String exceptionMessage = "Recipient could not be notified.";

        expect(emailService.sendEmail(message.text, recipient.email))
                .andThrow(new NotificationException("exceptionMessage"));
        expect(loggingService.log("exceptionMessage", "sendEmail"))
                .andReturn(true);
        expect(smsService.sendSMS(message.text, recipient.phoneNumber))
                .andReturn(false);
        expect(loggingService.log("Can't send SMS.", "sendSms"))
                .andReturn(true);

        replayAll();
        try {
            notificationService.notifyAbout(message);
        } catch (NotificationException e) {
            Assert.assertEquals(exceptionMessage, e.getMessage());
        }
        verifyAll();
    }
}
