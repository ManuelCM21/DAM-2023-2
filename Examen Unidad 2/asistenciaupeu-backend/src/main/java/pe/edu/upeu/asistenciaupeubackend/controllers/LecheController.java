/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.upeu.asistenciaupeubackend.controllers;

//import com.google.gson.Gson;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pe.edu.upeu.asistenciaupeubackend.models.Leche;
import pe.edu.upeu.asistenciaupeubackend.services.LecheService;

/**
 *
 * @author DELL
 */
@RestController
@RequestMapping("/asis/leche")
public class LecheController {
    
    @Autowired
    private LecheService lecheService;
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity<List<Leche>> listLeche() {
        List<Leche> actDto = lecheService.findAll();
        
        //Gson gson = new Gson();
        //String jsonCartList = gson.toJson(actDto);
        //System.out.println("Ver Aqui: "+jsonCartList);
        return ResponseEntity.ok(actDto);
        //return new ResponseEntity<>(actDto, HttpStatus.OK);
    }
    
    @PostMapping("/crear")
    public ResponseEntity<Leche> createLeche(@RequestBody Leche Leche) {
        Leche data = lecheService.save(Leche);
        return ResponseEntity.ok(data);
    }
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Leche> getLecheById(@PathVariable Long id) {
        Leche leche = lecheService.getLecheById(id);
        return ResponseEntity.ok(leche);
    }
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteLeche(@PathVariable Long id) {
        Leche leche = lecheService.getLecheById(id);
        return ResponseEntity.ok(lecheService.delete(leche.getId()));
    }
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Leche> updateLeche(@PathVariable Long id, @RequestBody Leche lecheDetails) {        
        Leche updatedLeche = lecheService.update(lecheDetails, id);
        return ResponseEntity.ok(updatedLeche);
    }      
}
