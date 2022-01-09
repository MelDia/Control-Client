<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9bc29573df.js" crossorigin="anonymous"></script>

        <title>Edit client</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/pag/commons/header.jsp"></jsp:include>

            <form action="${pageContext.request.contextPath}/ServletControlador?action=update&idCliente=${cliente.idCliente}"
              method="POST" class="py-4 mb-4 was-validated">            

            <section id="datails">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card text-success border-success mb-3">
                                <div class="card-header bg-transparent border-success mb-3">
                                    <h4>Edit client</h4>
                                </div>

                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="nombre">Name</label>
                                        <input type="text" class="form-control" name="nombre" placeholder="Name" value="${cliente.nombre}" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="apellido">Last name</label>
                                        <input type="text" class="form-control" name="apellido" placeholder="Last name" value="${cliente.apellido}" required>
                                    </div>                    


                                    <div class="form-group">  
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" name="email" placeholder="Email" value="${cliente.email}" required>                        
                                    </div>

                                    <div class="form-group">
                                        <label for="telefono">Phone number</label>
                                        <input type="tel" class="form-control" name="telefono" placeholder="Phone number" value="${cliente.telefono}" required>
                                    </div>

                                    <label for="saldo">Balance</label>
                                    <div class="form-group input-group mb-3">
                                        <span class="input-group-text">$</span>
                                        <input type="number" step="any" class="form-control" name="saldo" placeholder="Balance" value="${cliente.saldo}" required>                        
                                    </div>
                                </div>                                    

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="/WEB-INF/pag/commons/btnNavEdit.jsp"></jsp:include>

            </form>

        <jsp:include page="/WEB-INF/pag/commons/footer.jsp"></jsp:include>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    </body>
</html>

