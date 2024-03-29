package daos;

import entities.Reservation;
import entities.Room;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
public class ReservationDAO {
    EntityManager manager;

    // methods
    public List<Reservation> getAll() {
        return manager.createQuery("SELECT r FROM Reservation r", Reservation.class).getResultList();
    }

    public Reservation get(int id) {
        return manager.find(Reservation.class, id); // we get an element and find attaches it to the manager
    }

    public Reservation insert(Reservation element) {
        manager.getTransaction().begin(); // tell the database that we are going to change something
        manager.persist(element); // puts the new element into the manager (attaches it)
        manager.getTransaction().commit(); // changes the database and saves it
        return element;
    }

    public Reservation update(Reservation element) {
        manager.getTransaction().begin();
        manager.merge(element);
        manager.getTransaction().commit();
        return element;
    }

    public Reservation delete(Reservation element) {
        manager.getTransaction().begin();
        manager.remove(element);
        manager.getTransaction().commit();
        return element;
    }

    public int checkAvaible(LocalDate start, LocalDate end, int room_id){

        List<Reservation> allRes = this.getAll();
        for (Reservation reservation:allRes) {
            if (reservation.getRoom().getRoomId()==room_id){
                LocalDate reservationStart = reservation.getDateStart();
                LocalDate reservationEnd = reservation.getDateEnd();

                //Cas 2-3 si les deux dates sont égales :
                if (((start.isEqual(reservationStart)||start.isEqual(reservationEnd))&&(end.isEqual(reservationStart)||end.isEqual(reservationEnd))))
                    return 3;

                //cas 2-1 si les deux dates sont dans une période déjà réservée
                if ((start.isAfter(reservationStart) && start.isBefore(reservationEnd)) && (end.isAfter(reservationStart) && end.isBefore(reservationEnd)))
                    return 3;

                //cas 3-1  Si les deux dates couvrent une période déjà réservée
                if ((start.isBefore(reservationStart) && start.isBefore(reservationStart) && (end.isAfter(reservationEnd) && end.isAfter(reservationStart))))
                    return 4;

                //cas 1-1 si la date de début est égale à la date de fin ou de début d'une période déjà réservée
                if (start.isEqual(reservationStart) || start.isEqual(reservationEnd))
                    return 1;

                //cas 1-2 si la date de fin est égale à la date de fin ou de début d'une période déjà réservée
                if (end.isEqual(reservationStart) || end.isEqual(reservationEnd))
                    return 2;

                //cas 2-2 Si la date de début est entre le début et fin d'un réservation
                if (start.isAfter(reservationStart) && start.isBefore(reservationEnd))
                    return 1;

                //cas 2-3 Si la date de fin est entre début et fin d'un réservation
                if (end.isAfter(reservationStart) && end.isBefore(reservationEnd))
                    return 2;
            }

        }
        return 0;
    }

    public List<Room> getRoomsDate(LocalDate date){
        List<Reservation> reservations = this.getAll();
        List<Room> rooms = new ArrayList<>();
        for (Reservation reservation : reservations) {
            if(date.isBefore(reservation.getDateStart())||date.isAfter(reservation.getDateEnd())){
                if (!rooms.contains(reservation.getRoom())) rooms.add(reservation.getRoom());
            }
        }
        return rooms;
    }
}
