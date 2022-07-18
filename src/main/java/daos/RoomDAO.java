package daos;

import entities.Room;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.EntityManager;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
public class RoomDAO {
    EntityManager manager;

    // methods
    public List<Room> getAll() {
        return manager.createQuery("SELECT r FROM Room r", Room.class).getResultList();
    }

    public Room get(int id) {
        return manager.find(Room.class, id); // we get an element and find attaches it to the manager
    }

    public Room insert(Room element) {
        manager.getTransaction().begin(); // tell the database that we are going to change something
        manager.persist(element); // puts the new element into the manager (attaches it)
        manager.getTransaction().commit(); // changes the database and saves it
        return element;
    }

    public Room update(Room element) {
        manager.getTransaction().begin();
        manager.merge(element);
        manager.getTransaction().commit();
        return element;
    }

    public Room delete(Room element) {
        manager.getTransaction().begin();
        manager.remove(element);
        manager.getTransaction().commit();
        return element;
    }
}
