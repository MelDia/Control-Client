<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_AR"/>

<section id="client">
    <div class="container ">
        <div class="row">
            <div class="col-md-9">
                <div class="card text-success border-success mb-3 py-3">
                    <div class="card-header bg-transparent border-success mb-3">                        
                        <h4>Client list</h4>                        
                    </div>
                    <table class="table table-hover ">
                        <thead class="thead-dark ">
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Balance</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="cliente" items="${clientes}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${cliente.apellido} ${cliente.nombre} </td>                                    
                                    <td> <fmt:formatNumber value="${cliente.saldo}" type="currency"/></td> 
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?action=edit&idCliente=${cliente.idCliente}"
                                           class="btn btn-outline-secondary btn-block">
                                            <i class="fas fa-user-edit"></i> Edit
                                        </a>
                                    </td>
                                    
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?action=delete&idCliente=${cliente.idCliente}"
                                           class="btn btn-outline-danger btn-block">
                                            <i class="fas fa-user-times"></i></i> Delete
                                        </a>
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>

            <div class="col-md-3 ">
                <div class="card text-center bg-success text-white mb-3 rounded-pill">
                    <div class="card-body">
                        <h3 class="card-title">Total balance</h3>
                        <h3 class="display-6">
                            <fmt:formatNumber value="${totalBalance}" type="currency"/>
                        </h3>
                    </div>
                </div>

                <div class="card text-center bg-transparent text-success border-success mb-3 rounded-pill">
                    <div class="card-body">
                        <h3 class="card-title">Total customers</h3>
                        <h3 class="display-6">
                            <i class="fas fa-user-friends"></i> ${totalCustomers}
                        </h3>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- ADD CLIENT -->
<jsp:include page="/WEB-INF/pag/clients/addClient.jsp"/>