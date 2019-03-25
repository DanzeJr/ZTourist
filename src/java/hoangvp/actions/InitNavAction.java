/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.PlaceDAO;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.TourDTO;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;

/**
 *
 * @author Danze
 */
public class InitNavAction extends ActionSupport implements RequestAware{
    
    private static Logger logger = LogManager.getLogger(InitNavAction.class.getName());
        
    private Map<String, Object> request;
    
    public InitNavAction() {
    }
    
    @Override
    public String execute() {
        try {
            TourDAO td = new TourDAO();
            List<TourDTO> pTour = td.getPopularTours();
            if (!pTour.isEmpty()) {
                for (TourDTO s : pTour) {
                    s.setListPlace(td.findPlacesByTourID(s.getId()));
                }
                request.put("Ptour", pTour);
            } else {
                pTour = td.getTopNearestTours();
                for (TourDTO s : pTour) {
                    s.setListPlace(td.findPlacesByTourID(s.getId()));
                }
                request.put("Ptour", pTour);
            }
            
            PlaceDAO pd = new PlaceDAO();
            Map<String, String> dest = pd.getPlaceIdName();
            request.put("Dest", dest);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }
    
}
