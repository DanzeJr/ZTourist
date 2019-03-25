/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.TourDTO;
import java.sql.Timestamp;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class SearchTourAction extends ActionSupport {

    private static Logger logger = LogManager.getLogger(SearchTourAction.class.getName());

    private String destSearch, dateSearch;
    private Integer skipPage, page;
    private int durationSearch, priceSearch, priceMin, priceMax,  totalPages;
    private List<TourDTO> listTour;

    public SearchTourAction() {
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
            switch (priceSearch) {
                case 1:
                    priceMin = 0;
                    priceMax = 50;
                    break;
                case 2:
                    priceMin = 50;
                    priceMax = 250;
                    break;
                case 3:
                    priceMin = 250;
                    priceMax = 500;
                    break;
                case 4:
                    priceMin = 500;
                    priceMax = 1000;
                    break;
                case 5:
                    priceMin = 1000;
                    priceMax = 1500;
                    break;
                case 6:
                    priceMin = 1500;
                    priceMax = 2000;
                    break;
                case 7:
                    priceMin = 2000;
                    priceMax = 2500;
                    break;
                case 8:
                    priceMin = 2500;
                    priceMax = -1;
                    break;
                default:
                    priceMin = -1;
                    priceMax = -1;
                    break;
            }
            double total = dao.getTotalSearchTour(destSearch, Timestamp.valueOf(dateSearch), durationSearch, priceMin, priceMax);
            totalPages = (int) Math.ceil(total / 1);
            listTour = dao.findTour(skipPage, 1, destSearch, Timestamp.valueOf(dateSearch), durationSearch, priceMin, priceMax);
            for (TourDTO s : listTour) {
                s.setListPlace(dao.findPlacesByTourID(s.getId()));
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    public String getDestSearch() {
        return destSearch;
    }

    public void setDestSearch(String destSearch) {
        this.destSearch = destSearch;
    }

    public String getDateSearch() {
        return dateSearch;
    }

    public void setDateSearch(String dateSearch) {
        this.dateSearch = dateSearch;
    }

    public int getDurationSearch() {
        return durationSearch;
    }

    public void setDurationSearch(int durationSearch) {
        this.durationSearch = durationSearch;
    }

    public int getPriceSearch() {
        return priceSearch;
    }

    public void setPriceSearch(int priceSearch) {
        this.priceSearch = priceSearch;
    }

    public List<TourDTO> getListTour() {
        return listTour;
    }

    public void setListTour(List<TourDTO> listTour) {
        this.listTour = listTour;
    }

    public int getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(int priceMin) {
        this.priceMin = priceMin;
    }

    public int getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(int priceMax) {
        this.priceMax = priceMax;
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
