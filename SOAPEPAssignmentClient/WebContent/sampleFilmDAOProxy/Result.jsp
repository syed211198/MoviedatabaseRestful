<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleFilmDAOProxyid" scope="session" class="services.FilmDAOProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleFilmDAOProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleFilmDAOProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleFilmDAOProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        services.FilmDAO getFilmDAO10mtemp = sampleFilmDAOProxyid.getFilmDAO();
if(getFilmDAO10mtemp == null){
%>
<%=getFilmDAO10mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
</TABLE>
<%
}
break;
case 15:
        gotMethod = true;
        String stars_2id=  request.getParameter("stars20");
            java.lang.String stars_2idTemp = null;
        if(!stars_2id.equals("")){
         stars_2idTemp  = stars_2id;
        }
        String review_3id=  request.getParameter("review22");
            java.lang.String review_3idTemp = null;
        if(!review_3id.equals("")){
         review_3idTemp  = review_3id;
        }
        String director_4id=  request.getParameter("director24");
            java.lang.String director_4idTemp = null;
        if(!director_4id.equals("")){
         director_4idTemp  = director_4id;
        }
        String year_5id=  request.getParameter("year26");
        int year_5idTemp  = Integer.parseInt(year_5id);
        String title_6id=  request.getParameter("title28");
            java.lang.String title_6idTemp = null;
        if(!title_6id.equals("")){
         title_6idTemp  = title_6id;
        }
        String id_7id=  request.getParameter("id30");
        int id_7idTemp  = Integer.parseInt(id_7id);
        %>
        <jsp:useBean id="services1Film_1id" scope="session" class="services.Film" />
        <%
        services1Film_1id.setStars(stars_2idTemp);
        services1Film_1id.setReview(review_3idTemp);
        services1Film_1id.setDirector(director_4idTemp);
        services1Film_1id.setYear(year_5idTemp);
        services1Film_1id.setTitle(title_6idTemp);
        services1Film_1id.setId(id_7idTemp);
        boolean updateFilm15mtemp = sampleFilmDAOProxyid.updateFilm(services1Film_1id);
        String tempResultreturnp16 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updateFilm15mtemp));
        %>
        <%= tempResultreturnp16 %>
        <%
break;
case 32:
        gotMethod = true;
        services.Film[] getAllFilms32mtemp = sampleFilmDAOProxyid.getAllFilms();
if(getAllFilms32mtemp == null){
%>
<%=getAllFilms32mtemp %>
<%
}else{
        String tempreturnp33 = null;
        if(getAllFilms32mtemp != null){
        java.util.List listreturnp33= java.util.Arrays.asList(getAllFilms32mtemp);
        tempreturnp33 = listreturnp33.toString();
        }
        %>
        <%=tempreturnp33%>
        <%
}
break;
case 35:
        gotMethod = true;
        String searchBy_8id=  request.getParameter("searchBy38");
            java.lang.String searchBy_8idTemp = null;
        if(!searchBy_8id.equals("")){
         searchBy_8idTemp  = searchBy_8id;
        }
        String userinput_9id=  request.getParameter("userinput40");
            java.lang.String userinput_9idTemp = null;
        if(!userinput_9id.equals("")){
         userinput_9idTemp  = userinput_9id;
        }
        services.Film[] searchFilms35mtemp = sampleFilmDAOProxyid.searchFilms(searchBy_8idTemp,userinput_9idTemp);
if(searchFilms35mtemp == null){
%>
<%=searchFilms35mtemp %>
<%
}else{
        String tempreturnp36 = null;
        if(searchFilms35mtemp != null){
        java.util.List listreturnp36= java.util.Arrays.asList(searchFilms35mtemp);
        tempreturnp36 = listreturnp36.toString();
        }
        %>
        <%=tempreturnp36%>
        <%
}
break;
case 42:
        gotMethod = true;
        String id_10id=  request.getParameter("id57");
        int id_10idTemp  = Integer.parseInt(id_10id);
        services.Film getFilmByID42mtemp = sampleFilmDAOProxyid.getFilmByID(id_10idTemp);
if(getFilmByID42mtemp == null){
%>
<%=getFilmByID42mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">stars:</TD>
<TD>
<%
if(getFilmByID42mtemp != null){
java.lang.String typestars45 = getFilmByID42mtemp.getStars();
        String tempResultstars45 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestars45));
        %>
        <%= tempResultstars45 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">review:</TD>
<TD>
<%
if(getFilmByID42mtemp != null){
java.lang.String typereview47 = getFilmByID42mtemp.getReview();
        String tempResultreview47 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typereview47));
        %>
        <%= tempResultreview47 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">director:</TD>
<TD>
<%
if(getFilmByID42mtemp != null){
java.lang.String typedirector49 = getFilmByID42mtemp.getDirector();
        String tempResultdirector49 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedirector49));
        %>
        <%= tempResultdirector49 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">year:</TD>
<TD>
<%
if(getFilmByID42mtemp != null){
%>
<%=getFilmByID42mtemp.getYear()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">title:</TD>
<TD>
<%
if(getFilmByID42mtemp != null){
java.lang.String typetitle53 = getFilmByID42mtemp.getTitle();
        String tempResulttitle53 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typetitle53));
        %>
        <%= tempResulttitle53 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getFilmByID42mtemp != null){
%>
<%=getFilmByID42mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 59:
        gotMethod = true;
        String stars_12id=  request.getParameter("stars64");
            java.lang.String stars_12idTemp = null;
        if(!stars_12id.equals("")){
         stars_12idTemp  = stars_12id;
        }
        String review_13id=  request.getParameter("review66");
            java.lang.String review_13idTemp = null;
        if(!review_13id.equals("")){
         review_13idTemp  = review_13id;
        }
        String director_14id=  request.getParameter("director68");
            java.lang.String director_14idTemp = null;
        if(!director_14id.equals("")){
         director_14idTemp  = director_14id;
        }
        String year_15id=  request.getParameter("year70");
        int year_15idTemp  = Integer.parseInt(year_15id);
        String title_16id=  request.getParameter("title72");
            java.lang.String title_16idTemp = null;
        if(!title_16id.equals("")){
         title_16idTemp  = title_16id;
        }
        String id_17id=  request.getParameter("id74");
        int id_17idTemp  = Integer.parseInt(id_17id);
        %>
        <jsp:useBean id="services1Film_11id" scope="session" class="services.Film" />
        <%
        services1Film_11id.setStars(stars_12idTemp);
        services1Film_11id.setReview(review_13idTemp);
        services1Film_11id.setDirector(director_14idTemp);
        services1Film_11id.setYear(year_15idTemp);
        services1Film_11id.setTitle(title_16idTemp);
        services1Film_11id.setId(id_17idTemp);
        boolean insertFilm59mtemp = sampleFilmDAOProxyid.insertFilm(services1Film_11id);
        String tempResultreturnp60 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(insertFilm59mtemp));
        %>
        <%= tempResultreturnp60 %>
        <%
break;
case 76:
        gotMethod = true;
        String id_18id=  request.getParameter("id79");
        int id_18idTemp  = Integer.parseInt(id_18id);
        boolean deleteFilm76mtemp = sampleFilmDAOProxyid.deleteFilm(id_18idTemp);
        String tempResultreturnp77 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deleteFilm76mtemp));
        %>
        <%= tempResultreturnp77 %>
        <%
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>