package Homework5;

import org.junit.Assert;
import org.junit.Test;


/**
 * Distance Exception
 */
class DistanceException extends Exception {
    public DistanceException(String message) {
        super(message);
    }
}

/**
 * Whenever the not existing oldest human wants to try buy a ticket.
 */
class TooOldException extends Exception {
    public TooOldException() {
        super("You break the record of Jeanne Calment, congratulations");
    }
}


/**
 * Class to test, will calculate the price of the Ticket.
 */
class Ticket {
    private static float delta = 0.005f;
    private static float factor = 0.10f;

    static float calculateTicketPrice(float distance, int age) throws DistanceException, TooOldException {
        float price;

        if (distance < 0.0f) {
            throw new DistanceException("Distance is negative");
        }
        else if (distance <= 10.00f) {
            price =  1.00f;
        }
        else if (distance <= 100.00f) {
            price =  distance * factor;
        }
        else if (distance <= 200.00f) {
            price =  15.00f;
        }
        else {
            throw new DistanceException("Distance is too far");
        }

        if (age >= 0) {
            if (age <= 15) {
                return 0.0f;
            }
            else if (age <= 18 || age >= 65 && age < 150) {
                return price * 0.50f;
            }
            else if (age >= 150) {
                throw new TooOldException();
            }
        }
        return price;
    }
}

/**
 * Entwickeln Sie testgetrieben die Funktionalität: Der Ticketpreis von 0 km bis einschließlich 10 km
 * beträgt 1.00 EUR, ab 10 km bis einschließlich 100 km 10% der Entfernung, bei mehr als 100 km
 * und höchstens 200 km beträgt der Fahrpreis einheitlich 15.00 EUR. Längere Distanzen stehen
 * nicht zur Verfügung und führen genauso wie negative Distanzen zu einer Ausnahme.
 *
 * Erweitern Sie die Funktion um folgende Funktionalität: Für Kinder unter 15 Jahren ist das Ticket
 * kostenlos, Jugendliche zwischen 15 Jahren und 18 Jahren sowie Pensionisten ab 65 Jahren
 * erhalten 50 % Preisnachlass. Alterswerte über 150 führen zu einer Ausnahme.
 */
public class TicketTest {
    float delta = 0.005f;

    /**
     * Limit analysis: -0.01 [ 0.00 | 0.01, ..., 9.99 | 10.00 ] 10.01
     */
    @Test
    public void shortDistanceTest() throws TooOldException {
        float valueBelow = -0.01f;
        float lowerLimit = 0.00f;
        float upperLimit = 10.00f;
        float valueAbove = 10.01f;

        float expected = 1.00f;
        float actual = 0.0f;
        int age = -1;


        // Throws error
        try {
            Ticket.calculateTicketPrice(valueBelow, age);
            Assert.fail();
        } catch (DistanceException e) {
            Assert.assertEquals("Distance is negative", e.getMessage());
        }

        // Pass
        try {
            actual = Ticket.calculateTicketPrice(lowerLimit, age);
            Assert.assertEquals(expected, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }

        // Pass
        try {
            actual = Ticket.calculateTicketPrice(upperLimit, age);
            Assert.assertEquals(expected, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }

        try {
            actual = Ticket.calculateTicketPrice(valueAbove, age);
            Assert.assertEquals(expected, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }
    }


    /**
     * Limit analysis: 9.99 [ 10.00 | 10.01, ..., 99.99 | 100.00 ] 100.01
     */
    @Test
    public void mediumDistanceTest() throws TooOldException {
        float valueBelow = 9.99f;
        float lowerLimit = 10.00f;
        float upperLimit = 100.00f;
        float valueAbove = 100.01f;

        float expectedValueBelow = 1.00f;
        float expectedValueAbove = 15.00f;
        float factor = 0.10f;
        float actual = 0.0f;
        int age = -1;


        // Throws error
        try {
            actual = Ticket.calculateTicketPrice(valueBelow, age);
            Assert.assertEquals(expectedValueBelow, actual, delta);
        } catch (DistanceException e) {
            Assert.assertEquals("Distance is negative", e.getMessage());
        }

        // Pass
        try {
            actual = Ticket.calculateTicketPrice(lowerLimit, age);
            Assert.assertEquals(lowerLimit * factor, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }

        // Pass
        try {
            actual = Ticket.calculateTicketPrice(upperLimit, age);
            Assert.assertEquals(upperLimit * factor, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }

        try {
            actual = Ticket.calculateTicketPrice(valueAbove, age);
            Assert.assertEquals(expectedValueAbove, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }
    }


    /**
     * Limit analysis: 99.99 [ 100.00 | 100.01, ..., 199.99 | 200.00 ] 200.01
     */
    @Test
    public void largeDistanceTest() throws TooOldException {
        float valueBelow = 99.99f;
        float lowerLimit = 100.00f;
        float upperLimit = 200.00f;
        float valueAbove = 200.01f;

        float expectedValueBelow = valueBelow * 0.10f;
        float expectedLowerLimit = lowerLimit * 0.10f;
        float expected = 15.00f;
        float actual = 0.0f;
        int age = -1;


        // Throws error
        try {
            actual = Ticket.calculateTicketPrice(valueBelow, age);
            Assert.assertEquals(expectedValueBelow, actual, delta);
        } catch (DistanceException e) {
            Assert.assertEquals("Distance is negative", e.getMessage());
        }

        // Pass
        try {
            actual = Ticket.calculateTicketPrice(lowerLimit, age);
            Assert.assertEquals(expectedLowerLimit, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }

        // Pass
        try {
            actual = Ticket.calculateTicketPrice(upperLimit, age);
            Assert.assertEquals(expected, actual, delta);
        } catch (Exception e) {
            Assert.fail();
        }

        try {
            actual = Ticket.calculateTicketPrice(valueAbove, age);
            Assert.fail();
        } catch (DistanceException e) {
            Assert.assertEquals("Distance is too far", e.getMessage());
        }
    }


    /**
     * Limit analysis: -1 [ 0 | 1, ..., 14 | 15 ] 16
     */
    @Test
    public void ageDiscountTest() throws DistanceException, TooOldException {
        int valueBelow = -1;
        int lowerLimit = 0;
        int upperLimit = 15;
        int valueAbove = 16;

        float distance = 10.0f;
        float expectedValueBelow = 1.0f;
        float expectedLowerLimit = 0.0f;
        float expectedUpperLimit = 0.0f;
        float expectedValueAbove = 0.5f;
        float actual;

        actual = Ticket.calculateTicketPrice(distance, valueBelow);
        Assert.assertEquals(expectedValueBelow, actual, delta);

        actual = Ticket.calculateTicketPrice(distance, lowerLimit);
        Assert.assertEquals(expectedLowerLimit, actual, delta);

        actual = Ticket.calculateTicketPrice(distance, upperLimit);
        Assert.assertEquals(expectedUpperLimit, actual, delta);

        actual = Ticket.calculateTicketPrice(distance, valueAbove);
        Assert.assertEquals(expectedValueAbove, actual, delta);
    }

    @Test(expected = TooOldException.class)
    public void toOldTest() throws DistanceException, TooOldException {
        Ticket.calculateTicketPrice(0.0f, 151);
    }
}