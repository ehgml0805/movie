package goodee.e1i6.movie.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import goodee.e1i6.movie.controller.EventController;
import goodee.e1i6.movie.service.VisitorService;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Visitor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@WebListener
public class VisitorListener implements HttpSessionListener {
	@Autowired private VisitorService visitorService;
	
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // 현재방문자 수 증가
        ServletContext context = se.getSession().getServletContext();
        Integer currentVisitors = (Integer) context.getAttribute("currentVisitors");
        if (currentVisitors == null) {
            currentVisitors = 0;
        }
        currentVisitors++;
        context.setAttribute("currentVisitors", currentVisitors);
        log.debug(TeamColor.JSM + currentVisitors + " <- 현재방문자 수");
    	
    	
        try {
        	int todayVisitorCount = visitorService.getTodayVisitorCount();
        	if (todayVisitorCount == 0) {
        		// 오늘 웹페이지에 첫 방문객일 경우 
        		visitorService.addVisitor(new Visitor());
        	} else {
        		// 아닐 경우 update
        		visitorService.modifyVisitor(new Visitor());
        	}
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    	// 현재 방문자 수 감소
        ServletContext context = se.getSession().getServletContext();
        Integer currentVisitors = (Integer) context.getAttribute("currentVisitors");
        if (currentVisitors != null && currentVisitors > 0) {
            currentVisitors--;
            context.setAttribute("currentVisitors", currentVisitors);
            log.debug(TeamColor.JSM + currentVisitors + " <- 현재방문자 수");
        }    
    }
}