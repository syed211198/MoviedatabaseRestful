/**
 * FilmDAO.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package services;

public interface FilmDAO extends java.rmi.Remote {
    public boolean updateFilm(services.Film film) throws java.rmi.RemoteException;
    public services.Film[] getAllFilms() throws java.rmi.RemoteException;
    public services.Film[] searchFilms(java.lang.String searchBy, java.lang.String userinput) throws java.rmi.RemoteException;
    public services.Film getFilmByID(int id) throws java.rmi.RemoteException;
    public boolean insertFilm(services.Film film) throws java.rmi.RemoteException;
    public boolean deleteFilm(int id) throws java.rmi.RemoteException;
}
