/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.PlaceDAO;
import hoangvp.dtos.PlaceDTO;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class ViewAllDestinationsStaffAction extends ActionSupport {

    private static Logger logger = LogManager.getLogger(ViewAllDestinationsStaffAction.class.getName());

    private Integer skipPage, page;
    private int totalPages;
    private List<PlaceDTO> listPlace;

    public ViewAllDestinationsStaffAction() {
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
            PlaceDAO dao = new PlaceDAO();
            double total = dao.getTotalDestinations();
            totalPages = (int) Math.ceil(total / 6);
            listPlace = dao.getAllDestinations(skipPage, 6);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    public List<PlaceDTO> getListPlace() {
        return listPlace;
    }

    public void setListPlace(List<PlaceDTO> listPlace) {
        this.listPlace = listPlace;
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
