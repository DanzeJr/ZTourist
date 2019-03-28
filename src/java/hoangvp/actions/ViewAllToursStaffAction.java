/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.TourDTO;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class ViewAllToursStaffAction extends ActionSupport {

    private static Logger logger = LogManager.getLogger(ViewAllToursStaffAction.class.getName());

    private Integer skipPage, page;
    private int totalPages;
    private List<TourDTO> listTour;

    public ViewAllToursStaffAction() {
    }

    @Override
    public String execute() {
        try {
            if (skipPage == null) {
                skipPage = 0;
            }
            if (page == null) {
                page = 1;
            }
            TourDAO dao = new TourDAO();
            double total = dao.getTotalTours();
            totalPages = (int) Math.ceil(total / 5);
            listTour = dao.getAllTours(skipPage, 5);
            for (TourDTO s : listTour) {
                s.setListPlace(dao.findPlacesByTourID(s.getId()));
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    public List<TourDTO> getListTour() {
        return listTour;
    }

    public void setListTour(List<TourDTO> listTour) {
        this.listTour = listTour;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getSkipPage() {
        return skipPage;
    }

    public void setSkipPage(Integer skipPage) {
        this.skipPage = skipPage;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

}
