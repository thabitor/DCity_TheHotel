package entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="room")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="room_id")
    private int roomId;
    @Column(name="description", columnDefinition="text")
    private String description;
    @Column(name="floor")
    private int floor;
    @Column(name="capacity")
    private int capacity;
    @Column(name="beds")
    private int beds;
    @Column(name="price", columnDefinition="double")
    private double price;
    @OneToMany(mappedBy="room")
    private List<Reservation> reservations;

    // constructor
    public Room(String description, int floor, int capacity, int beds, double price) {
        this.description = description;
        this.floor = floor;
        this.capacity = capacity;
        this.beds = beds;
        this.price = price;
    }
}
