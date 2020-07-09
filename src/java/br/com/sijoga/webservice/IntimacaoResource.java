/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.sijoga.webservice;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author mathe
 */
@Path("intimacao")
public class IntimacaoResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of IntimacaoResource
     */
    public IntimacaoResource() {
    }

    /**
     * Retrieves representation of an instance of br.com.sijoga.webservice.IntimacaoResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() {
        return "{\"data\":123\"}";
    }

    /**
     * PUT method for updating or creating an instance of IntimacaoResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
        
    }
}
