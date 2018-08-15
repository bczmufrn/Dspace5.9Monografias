<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Feedback form JSP
  -
  - Attributes:
  -    feedback.problem  - if present, report that all fields weren't filled out
  -    authenticated.email - email of authenticated user, if any
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>


<dspace:layout titlekey="jsp.feedback.form.title">
    <%-- <h1>Feedback Form</h1> --%>
    
   <!--  <h2>Equipe técnica</h2>
    <div class="content">
        <div class="row">
            <div class="col-lg-6">Repositorio</div>
            <div class="col-lg-6">Informática</div>
        </div>
    </div> -->

    <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-6">
                <h3 class="page-header"><strong>Bibliotecários</strong></h3>
                
                    <img align="center" class="img-circle img-responsive img-center" src="../../image/clediane.jpg" alt="">
                    <h3>Clediane
                        <small>Guedes</small>
                    </h3>
                    <p>Bibliotecária<br>
                    E-mail: clediane@bczm.ufrn.br<br>
                    Tel.: (84) 3342-2524</p>
               
                    <img align="center" class="img-circle img-responsive img-center" src="../../image/elisangela.jpg" alt="">
                    <h3>Elisângela
                        <small>Moura</small>
                    </h3>
                    <p>Bibliotecária<br>
                    E-mail: elisangela@bczm.ufrn.br<br>
                    Tel.: (84) 3342-2524</p>
                    
                    
                    <img align="center" class="img-circle img-responsive img-center" src="../../image/aniolly.jpg" alt="">
                    <h3>Aniolly
                        <small>Queiroz</small>
                    </h3>
                    <p>Bibliotecária<br>
                    E-mail: aniolly@bczm.ufrn.br<br>
                    Tel.: (84) 3342-2524</p>

                   
            </div>
                 

            <div class="col-lg-6">
                <h3 class="page-header"><strong>Desenvolvedores</strong></h3>
            
                
                    <img align="center" class="img-circle img-responsive img-center" src="../../image/andersonq.jpg" alt="">
                    <h3>Anderson
                        <small>Queiroz</small>
                    </h3>
                    <p>Eng. de Computação<br>
                    E-mail: andersonq@bczm.ufrn.br<br>
                    Tel.: (84) 3215-3854 </p>
                
                
                    <img align="center" class="img-circle img-responsive img-center" src="../../image/luiz.jpg" alt="">
                    <h3>Luiz Henrique
                        <small>Cabral</small>
                    </h3>
                    <p>Analista de Sistemas<br>
                    E-mail: luiz@bczm.ufrn.br<br>
                    Tel.: (84) 3215-3854 </p>
                
            </div>

        </div>         
 



</dspace:layout>
