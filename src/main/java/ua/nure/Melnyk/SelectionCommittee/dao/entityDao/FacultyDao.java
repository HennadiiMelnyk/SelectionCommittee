package ua.nure.Melnyk.SelectionCommittee.dao.entityDao;

import ua.nure.Melnyk.SelectionCommittee.dao.CrudDao;
import ua.nure.Melnyk.SelectionCommittee.model.Faculty;

import java.util.List;
/**
 * FacultyDao*/
public interface FacultyDao extends CrudDao {

    /**
     * Faculty
     */
    public void addFaculty(Faculty faculty);

    public void deleteFaculty(int id);

    public void updateFaculty(Faculty faculty);

    public List<Faculty> sortFacultyByAsc(Faculty faculty);

    public List<Faculty> sortFacultyByDesc(Faculty faculty);


}
