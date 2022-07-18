package services;

import entities.Reservation;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HotelService {
    private final EntityManagerFactory emf;
    private final EntityManager manager;

    // singleton
    private static HotelService instance;

    public static HotelService getInstance() {
        if (instance == null) {
            instance = new HotelService();
        }
        return instance;
    }
    // private constructor protected by singleton
    private HotelService() {
        this.emf = Persistence.createEntityManagerFactory("Hotel");
        this.manager = emf.createEntityManager();
    }

    // getters
    public EntityManager getManager() {
        return manager;
    }
}
