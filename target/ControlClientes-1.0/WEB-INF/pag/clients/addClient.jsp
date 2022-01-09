<div class="modal fade" id="agregarClienteModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-success bg-opacity-75 text-white">
                <h5 class="modal-title"> <i class="fas fa-user-plus"></i> Add user</h5>
                <button class="btn-close" data-bs-dismiss="modal">                    
                </button>
            </div>

            <form action="${pageContext.request.contextPath}/ServletControlador?action=insert" method="POST" class="was-validated">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre">Name</label>
                        <input type="text" class="form-control" name="nombre" placeholder="Name" required>
                    </div>

                    <div class="form-group">
                        <label for="apellido">Last name</label>
                        <input type="text" class="form-control" name="apellido" placeholder="Last name" required>
                    </div>                    

                    
                    <div class="form-group">  
                        <label for="email">Email</label>
                        <input type="text" class="form-control" name="email" placeholder="Email" required>                        
                    </div>

                    <div class="form-group">
                        <label for="telefono">Phone number</label>
                        <input type="tel" class="form-control" name="telefono" placeholder="Phone number" required>
                    </div>

                    <label for="saldo">Balance</label>
                    <div class="form-group input-group mb-3">
                        <span class="input-group-text">$</span>
                        <input type="number" step="any" class="form-control" name="saldo" placeholder="Balance" required>                        
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button class="btn btn-outline-success btn-block rounded-pill" type="submit">
                        Save
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>