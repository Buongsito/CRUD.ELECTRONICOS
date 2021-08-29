package com.example.Wongsito;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import Cosas.Direccion.BeanDireccion;
import Cosas.Electronicos.BeanElectronicos;
import Cosas.Electronicos.DaoElectronicos;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "ServleElectronicos", urlPatterns = {
        "/readElectronicos",
        "/createElectronicos",
        "/updateElectronicos",
        "/deleteElectronicos",
        "/findById"})

public class ServletElectronicos extends HttpServlet {
    private Map map = new HashMap();
    final private Logger CONSOLE = LoggerFactory.getLogger(ServletElectronicos.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        map.put("listElectronicos", new DaoElectronicos().findAll());
        write(response, map);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        BeanElectronicos beanElectronicos = new BeanElectronicos();
        BeanDireccion beanDireccion = new BeanDireccion();

        switch (action) {
            case "create":

                String nombre = request.getParameter("nombre");
                String calle = request.getParameter("calle");
                String colonia = request.getParameter("colonia");
                int postal = Integer.parseInt(request.getParameter("postal"));
                String estado = request.getParameter("estado");
                String pais = request.getParameter("pais");

                beanDireccion = new BeanDireccion(0, calle, colonia, postal, estado, pais);
                beanElectronicos = new BeanElectronicos(0, nombre, beanDireccion, 1);

                boolean flag = new DaoElectronicos().create(beanElectronicos);

                if (flag) {
                    map.put("message", "Se ha registrado correctamente");
                } else {
                    map.put("message", "No se registró correctamente");
                }
                response.sendRedirect(request.getContextPath() + "/readElectronicos");
                break;


            case "update":

                int direccionId1 = Integer.parseInt(request.getParameter("direccionId"));
                int id1 = Integer.parseInt(request.getParameter("id"));
                String nombre1 = request.getParameter("nombre");
                String calle1 = request.getParameter("calle");
                String colonia1 = request.getParameter("colonia");
                int postal1 = Integer.parseInt(request.getParameter("postal"));
                String estado1 = request.getParameter("estado");
                String pais1 = request.getParameter("pais");

                beanDireccion = new BeanDireccion(id1, calle1, colonia1, postal1, estado1, pais1);
                beanElectronicos = new BeanElectronicos(direccionId1, nombre1, beanDireccion, 1);

                boolean flag1 = new DaoElectronicos().update(beanElectronicos);

                if (flag1) {
                    CONSOLE.error("Se ha actualizado correctamente");
                } else {
                    CONSOLE.error("message", "No se actualizó correctamente");
                }
                request.getRequestDispatcher("/views/electronicos/electronico.jsp").forward(request, response);
                break;


            case "delete":

                if (new DaoElectronicos().delete(Integer.parseInt(request.getParameter("id")))) {
                    request.setAttribute("message", "Se ha eliminado correctamente");
                } else {
                    CONSOLE.error("No se eliminó correctamente");
                }
                request.getRequestDispatcher("/views/electronicos/electronico.jsp").forward(request, response);
                break;


            case "findById":

                int serch = Integer.parseInt(request.getParameter("id"));

                beanElectronicos = new DaoElectronicos().findById(serch);

                map.put("electronicos", beanElectronicos);

                response.sendRedirect(request.getContextPath() + "/readElectronicos");
                break;


            default:
                request.getRequestDispatcher("/").forward(request, response);
                break;
        }

    }

    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException {
        response.setContentType("aplication/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(map));
    }
}
