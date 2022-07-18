package daos;

import entities.Client;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.EntityManager;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
public class ClientDAO {
    EntityManager manager;

    // methods
    public List<Client> getAll() {
        return manager.createQuery("SELECT c FROM Client c", Client.class).getResultList();
    }

    public Client get(int id) {
        return manager.find(Client.class, id); // we get an element and find attaches it to the manager
    }

    public Client insert(Client element) {
        manager.getTransaction().begin(); // tell the database that we are going to change something
        manager.persist(element); // puts the new element into the manager (attaches it)
        manager.getTransaction().commit(); // changes the database and saves it
        return element;
    }

    public Client update(Client element) {
        manager.getTransaction().begin();
        manager.merge(element);
        manager.getTransaction().commit();
        return element;
    }

    public Client delete(Client element) {
        manager.getTransaction().begin();
        manager.remove(element);
        manager.getTransaction().commit();
        return element;
    }
}
