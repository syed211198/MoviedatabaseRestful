package services;

public class FilmDAOProxy implements services.FilmDAO {
  private String _endpoint = null;
  private services.FilmDAO filmDAO = null;
  
  public FilmDAOProxy() {
    _initFilmDAOProxy();
  }
  
  public FilmDAOProxy(String endpoint) {
    _endpoint = endpoint;
    _initFilmDAOProxy();
  }
  
  private void _initFilmDAOProxy() {
    try {
      filmDAO = (new services.FilmDAOServiceLocator()).getFilmDAO();
      if (filmDAO != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)filmDAO)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)filmDAO)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (filmDAO != null)
      ((javax.xml.rpc.Stub)filmDAO)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public services.FilmDAO getFilmDAO() {
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO;
  }
  
  public boolean updateFilm(services.Film film) throws java.rmi.RemoteException{
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO.updateFilm(film);
  }
  
  public services.Film[] getAllFilms() throws java.rmi.RemoteException{
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO.getAllFilms();
  }
  
  public services.Film[] searchFilms(java.lang.String searchBy, java.lang.String userinput) throws java.rmi.RemoteException{
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO.searchFilms(searchBy, userinput);
  }
  
  public services.Film getFilmByID(int id) throws java.rmi.RemoteException{
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO.getFilmByID(id);
  }
  
  public boolean insertFilm(services.Film film) throws java.rmi.RemoteException{
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO.insertFilm(film);
  }
  
  public boolean deleteFilm(int id) throws java.rmi.RemoteException{
    if (filmDAO == null)
      _initFilmDAOProxy();
    return filmDAO.deleteFilm(id);
  }
  
  
}