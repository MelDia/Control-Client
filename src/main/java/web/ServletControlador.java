package web;

import datos.ClienteDaoJDBC;
import domain.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    //GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "edit": {
                    try {
                        this.editClient(request, response);
                    } catch (SQLException ex) {
                        ex.printStackTrace(System.out);
                    }
                }
                break;

                case "delete": {
                    try {
                        this.deleteClient(request, response);
                    } catch (SQLException ex) {
                        ex.printStackTrace(System.out);
                    }
                }
                break;

                default: {
                    try {
                        this.actionDefault(request, response);
                    } catch (SQLException ex) {
                        ex.printStackTrace(System.out);
                    }
                }
            }
        } else {
            try {
                this.actionDefault(request, response);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
    }

    //DEFAULT ACTION
    protected void actionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Cliente> clientes = new ClienteDaoJDBC().list();
        System.out.println("clientes: " + clientes);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("clientes", clientes);
        sesion.setAttribute("totalCustomers", clientes.size());
        sesion.setAttribute("totalBalance", this.calculateTotalBalance(clientes));
//        request.getRequestDispatcher("clientes.jsp").forward(request, response);
        response.sendRedirect("clientes.jsp");
    }

    //Total balance function
    private double calculateTotalBalance(List<Cliente> clientes) {
        double totalBalance = 0;
        for (Cliente cliente : clientes) {
            totalBalance += cliente.getSaldo();
        }
        return totalBalance;
    }

    //POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //ACTION INSERT
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "insert": {
                    try {
                        this.insertClient(request, response);
                    } catch (SQLException ex) {
                        ex.printStackTrace(System.out);
                    }
                }
                break;

                case "update": {
                    try {
                        this.updateClient(request, response);
                    } catch (SQLException ex) {
                        ex.printStackTrace(System.out);
                    }
                }
                break;

                default: {
                    try {
                        this.actionDefault(request, response);
                    } catch (SQLException ex) {
                        ex.printStackTrace(System.out);
                    }
                }
            }
        } else {
            try {
                this.actionDefault(request, response);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
    }

    //METHOD INSERT CLIENT
    private void insertClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = 0;
        String saldoString = request.getParameter("saldo");
        if (saldoString != null && !"".equals(saldoString)) {
            saldo = Double.parseDouble(saldoString);
        }

        Cliente cliente = new Cliente(nombre, apellido, email, telefono, saldo);

        int modifiedRegister = new ClienteDaoJDBC().insert(cliente);
        System.out.println("modifiedRegister: " + modifiedRegister);

        this.actionDefault(request, response);
    }

    //METHOD UPDATE CLIENT
    private void updateClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = 0;
        String saldoString = request.getParameter("saldo");
        if (saldoString != null && !"".equals(saldoString)) {
            saldo = Double.parseDouble(saldoString);
        }
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

        Cliente cliente = new Cliente(idCliente, nombre, apellido, email, telefono, saldo);

        int modifiedRegister = new ClienteDaoJDBC().update(cliente);
        System.out.println("modifiedRegister: " + modifiedRegister);

        this.actionDefault(request, response);
    }

    //METHOD EDIT CLIENT
    private void editClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        Cliente cliente = new ClienteDaoJDBC().find(new Cliente(idCliente));
        request.setAttribute("cliente", cliente);
        String editJsp = "WEB-INF/pag/clients/editClient.jsp";
        request.getRequestDispatcher(editJsp).forward(request, response);
    }

    //METHOD DELETE CLIENT
    private void deleteClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

        Cliente cliente = new Cliente(idCliente);

        int modifiedRegister = new ClienteDaoJDBC().delete(cliente);
        System.out.println("modifiedRegister: " + modifiedRegister);

        this.actionDefault(request, response);
    }

}
