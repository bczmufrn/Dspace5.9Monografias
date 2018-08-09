<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
	    <footer class="navbar navbar-inverse navbar-bottom">
	        <div id="designedby" class="container text-muted">
	        	<div id="footer_feedback" class="pull-left" style="font-size:10pt;padding-left:20px;">                                    
	                                
					<a target="_blank" href="http://www.ufrn.br"><img src="/jspui/image/logo_ufrn_dspace.png" alt="Logo UFRN" width="88px" height="31px"></a>&nbsp;&nbsp; 
					<a target="_blank" href="http://www.bczm.ufrn.br"><img src="/jspui/image/BCZM.png" alt="Logo BCZM" width="75px" height="50px"></a>
					<a target="_blank" href="http://www.ibict.br"><img src="/jspui/image/logo_ibict.png" alt="Logo IBICT" width="100px" height="45px"></a>
	            </div>
									
				
	            <div id="footer_feedback" class="pull-right">                                    
                    <p class="text-muted">
					<span class="glyphicon glyphicon-envelope"></span> <a target="_blank" href="/jspui/feedback/form.jsp">Comentários</a>&nbsp;|
					<span class="glyphicon glyphicon-stats"></span> <a href="/jspui/statistics?level=general&amp;type=access&amp;page=downviews-series">Estatísticas</a>&nbsp;|<span class="glyphicon glyphicon-user"></span> <a target="_blank" href="/jspui/feedback/equip/equipe.jsp">Equipe Técnica</a>
					<br><a target="_blank" href="http://www.ufrn.br/">Universidade Federal do Rio Grande do Norte</a> Copyright&nbsp;©&nbsp;2015 
                    <a href="/htmlmap"></a></p>
                </div>
			</div>
	    </footer>
    </body>
</html>