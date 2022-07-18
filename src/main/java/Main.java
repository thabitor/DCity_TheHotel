import daos.ClientDAO;
import entities.Client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Hotel");
        EntityManager manager = emf.createEntityManager();
        ClientDAO clientDAO = new ClientDAO(manager);

        ////////////////////////////////////////////////////////////
        // GET ONE
        System.out.println(clientDAO.get(1));
        System.out.println("-------------------------------------");

        // INSERT
        Client newClient = new Client("Sebastien", "Ruiz", "sebastien.ruiz@gmail.com", "0123456789", LocalDate.parse("01/01/1980", formatter));
        System.out.println(clientDAO.insert(newClient));
        System.out.println("-------------------------------------");

        // DELETE
        Client clientToDelete = clientDAO.get(4);
        System.out.println(clientDAO.delete(clientToDelete));
        System.out.println("-------------------------------------");

        // GET ALL
        List<Client> clientList = clientDAO.getAll();
        clientList.forEach(System.out::println);
        System.out.println("-------------------------------------");
    }
}
