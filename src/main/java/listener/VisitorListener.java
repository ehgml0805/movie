package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class VisitorListener implements HttpSessionListener {

    public VisitorListener() {
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // TODO: Add your code for handling new visitors here
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // TODO: Add any cleanup logic here if needed
    }
}