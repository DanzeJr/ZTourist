/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.EmployeeDAO;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.EmployeeDTO;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class ViewAllStaffsAction extends ActionSupport {

    private static Logger logger = LogManager.getLogger(ViewAllStaffsAction.class.getName());

    private Integer skipPage, page;
    private int totalPages;
    private List<EmployeeDTO> listStaff;

    public ViewAllStaffsAction() {
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
            EmployeeDAO dao = new EmployeeDAO();
            double total = dao.getTotalStaffs();
            totalPages = (int) Math.ceil(total / 5);
            listStaff = dao.getAllStaffs(skipPage, 5);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    public List<EmployeeDTO> getListStaff() {
        return listStaff;
    }

    public void setListStaff(List<EmployeeDTO> listStaff) {
        this.listStaff = listStaff;
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
