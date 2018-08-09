<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Default navigation bar
--%>
<style>
    .dropdown-submenu {
        position: relative;
    }

    .dropdown-submenu .dropdown-menu {
        top: 0;
        left: 100%;
        margin-top: -1px;
    }
    </style>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="/WEB-INF/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="java.util.Map" %>
<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Is the logged in user an admin
    Boolean admin = (Boolean)request.getAttribute("is.admin");
    boolean isAdmin = (admin == null ? false : admin.booleanValue());

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf( '?' );
    if( c > -1 )
    {
        currentPage = currentPage.substring( 0, c );
    }

    // E-mail may have to be truncated
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }

    // get the browse indices

	BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
    BrowseInfo binfo = (BrowseInfo) request.getAttribute("browse.info");
    String browseCurrent = "";
    if (binfo != null)
    {
        BrowseIndex bix = binfo.getBrowseIndex();
        // Only highlight the current browse, only if it is a metadata index,
        // or the selected sort option is the default for the index
        if (bix.isMetadataIndex() || bix.getSortOption() == binfo.getSortOption())
        {
            if (bix.getName() != null)
    			browseCurrent = bix.getName();
        }
    }
%>


       <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="http://www.ufrn.br" style="padding: 0px;"><img height="48px" src="<%= request.getContextPath() %>/image/dspace-logo-only.png" /></a>
       </div>
       <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
	     <!--A pucrs utilizou uma largura excessiva. Valor corrigido-->
         <ul class="nav navbar-nav" style="width: 500px;">
           <li class="<%= currentPage.endsWith("/home.jsp")? "active" : "" %>"><a href="<%= request.getContextPath() %>/"><span class="glyphicon glyphicon-home"></span> <fmt:message key="jsp.layout.navbar-default.home"/></a></li>

           <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-default.browse"/> <b class="caret"></b></a>
             <ul class="dropdown-menu">
               <li><a href="<%= request.getContextPath() %>/community-list"><fmt:message key="jsp.layout.navbar-default.communities-collections"/></a></li>
				<li class="divider"></li>
				<li class="dropdown-header">Browse Items by:</li>
				<%-- Insert the dynamic browse indices here --%>

				<%
					for (int i = 0; i < bis.length; i++)
					{
						BrowseIndex bix = bis[i];
						String key = "browse.menu." + bix.getName();
					%>
				      			<li><a href="<%= request.getContextPath() %>/browse?type=<%= bix.getName() %>"><fmt:message key="<%= key %>"/></a></li>
					<%
					}
				%>

				<%-- End of dynamic browse indices --%>

            </ul>
          </li>
      <!-- Lista de documentos adicionada por Anderson em 09/06/2015 -->

		  <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sobre a BDM<b class="caret"></b></a>
             <ul class="dropdown-menu" role="menu">
        				<li><a href="http://monografias.ufrn.br:8080/jspui/documentos/Politica_de_informacao_da_BDM_UFRN.pdf" target="_blank">Política de Informação</a></li>
                <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/Fluxo_Geral_BDM.pdf" target="_blank">Fluxo da BDM</a></li>
                <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/FAQ-MONOGRAFIAS_2018.docx" target="_blank">FAQ da BDM</a></li>
                <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/historico_bdm.pdf" target="_blank">Histórico da BDM</a></li>
                <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/Portaria-Comissao-Gestora.pdf" target="_blank">Comissão Gestora</a></li>

                <li class="divider"></li>
				        <li class="dropdown-header">Tutoriais:</li>
                <li class="dropdown-submenu">
                  <a class="test" tabindex="-1" href="#">Tutorial para cadastro <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/TUTORIAL_CADASTRO_BDM_UFRN.ppsx" target="_blank">PPS</a></li>
                    <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/TUTORIAL_CADASTRO_BDM_UFRN.pdf" target="_blank">PDF</a></li>
                  </ul>
                </li>

                <li class="dropdown-submenu">
                  <a class="test" tabindex="-1" href="#">Tutorial para depósito <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/TUTORIAL_DEPOSITO_BDM_UFRN.ppsx" target="_blank">PPS</a></li>
                    <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/TUTORIAL_DEPOSITO_BDM_UFRN.pdf" target="_blank">PDF</a></li>
                  </ul>
                </li>

                <li class="dropdown-submenu">
                  <a class="test" tabindex="-1" href="#">Tutorial para validação de arquivo <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/TUTORIAL_VALIDACAO_ARQUIVO_BDM_UFRN.ppsx" target="_blank">PPS</a></li>
                    <li><a href="http://monografias.ufrn.br:8080/jspui/documentos/TUTORIAL_VALIDACAO_ARQUIVO_BDM_UFRN.pdf" target="_blank">PDF</a></li>
                  </ul>
                </li>


             </ul>
          </li>


          <%-- <li class="<%= ( currentPage.endsWith( "/help" ) ? "active" : "" ) %>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") %>"><fmt:message key="jsp.layout.navbar-default.help"/></dspace:popup></li> --%>


		  <li>
			<div style="padding-top:15px;padding-left:25px;">
				<a href="?locale=pt_BR"><img alt="Português" title="Português" src="/jspui/image/pt_BR2.png"></a> 
				<a href="?locale=en"><img alt="English" title="English" src="/jspui/image/en2.png"></a> 
				<%--<a href="?locale=es"><img alt="Español" title="Español" src="/jspui/image/es2.png"></a></div>--%>
			</li>

       </ul>
       <div class="nav navbar-nav navbar-right">
		<ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
         <%
    if (user != null)
    {
		%>
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <fmt:message key="jsp.layout.navbar-default.loggedin">
		      <fmt:param><%= StringUtils.abbreviate(navbarEmail, 20) %></fmt:param>
		  </fmt:message> <b class="caret"></b></a>
		<%
    } else {
		%>
             <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <fmt:message key="jsp.layout.navbar-default.sign"/> <b class="caret"></b></a>
	<% } %>
             <ul class="dropdown-menu">
               <li><a href="<%= request.getContextPath() %>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
               <li><a href="<%= request.getContextPath() %>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
               <li><a href="<%= request.getContextPath() %>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li>

		<%
		  if (isAdmin)
		  {
		%>
			   <li class="divider"></li>
               <li><a href="<%= request.getContextPath() %>/dspace-admin"><fmt:message key="jsp.administer"/></a></li>
		<%
		  }
		  if (user != null) {
		%>
		<li><a href="<%= request.getContextPath() %>/logout"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="jsp.layout.navbar-default.logout"/></a></li>
		<% } %>
             </ul>
           </li>
          </ul>

	<%-- Search Box --%>
  <%  if (!request.getServletPath().equals("/home.jsp"))
      {
  %>

	<form method="get" action="<%= request.getContextPath() %>/simple-search" class="navbar-form navbar-right" scope="search">
	    <div class="form-group">
          <input type="text" class="form-control" placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query" id="tequery" size="25"/>
        </div>
        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
<% } %>
<%--               <br/><a href="<%= request.getContextPath() %>/advanced-search"><fmt:message key="jsp.layout.navbar-default.advanced"/></a>
<%

			if (ConfigurationManager.getBooleanProperty("webui.controlledvocabulary.enable"))
			{
%>
              <br/><a href="<%= request.getContextPath() %>/subject-search"><fmt:message key="jsp.layout.navbar-default.subjectsearch"/></a>
<%
            }
%> --%>

	</form></div>
    </nav>

  <script>
  $(document).ready(function(){
    $('.dropdown-submenu a.test').on("click", function(e){
      $(this).next('ul').toggle();
      e.stopPropagation();
      e.preventDefault();
    });
  });
  </script>
