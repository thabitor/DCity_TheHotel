package entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="reservation")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="reservation_id")
    private int reservationId;
    @Column(name="date_start", columnDefinition="date")
    private LocalDate dateStart;
    @Column(name="date_end", columnDefinition="date")
    private LocalDate dateEnd;
    @Column(name="price", columnDefinition="double")
    private double price;
    @Column(name="capacity")
    private int capacity;
    @ManyToOne()
    @JoinColumn(name="client_id")
    private Client client;
    @ManyToOne()
    @JoinColumn(name="room_id")
    private Room room;

    // constructor

    public Reservation(LocalDate dateStart, LocalDate dateEnd, double price, int capacity, Client client, Room room) {
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.price = price;
        this.capacity = capacity;
        this.client = client;
        this.room = room;
    }
}
