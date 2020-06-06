package com.example.demo.Controllers;

import com.example.demo.Dto.ProductoServiceApi;
import com.example.demo.Entity.Producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;


@Controller
@RequestMapping("/producto")
public class ProductoController {

    @Autowired
    ProductoServiceApi productoServiceApi;


    @GetMapping(value = {"", "/"})
    public String listaProducto(@RequestParam Map<String, Object> params, Model model) {



        int page = params.get("page") != null ? (Integer.valueOf(params.get("page").toString()) - 1) : 0;

        PageRequest pageRequest = PageRequest.of(page, 7);

        Page<Producto> pageProduct = productoServiceApi.getAll(pageRequest);

        int totalPage = pageProduct.getTotalPages();
        if (totalPage > 0) {
            List<Integer> pages = IntStream.rangeClosed(1, totalPage).boxed().collect(Collectors.toList());
            model.addAttribute("pages", pages);
        }

        model.addAttribute("listaProductos", pageProduct.getContent());
        model.addAttribute("current", page + 1);
        model.addAttribute("next", page + 2);
        model.addAttribute("prev", page);
        model.addAttribute("last", totalPage);

        return "producto/listar";
    }


}
