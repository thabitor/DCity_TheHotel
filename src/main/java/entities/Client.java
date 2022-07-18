package entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table (name="client")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="client_id")
    private int clientId;
    @Column(name="first_name")
    private String firstName;
    @Column(name="last_name")
    private String lastName;
    @Column(name="mail")
    private String mail;
    @Column(name="telephone")
    private String telephone;
    @Column(name="birth_date")
    private LocalDate birthDate;
    @OneToMany(mappedBy="client")
    private List<Reservation> reservations;

    // constructor
    public Client(String firstName, String lastName, String mail, String telephone, LocalDate birthDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.mail = mail;
        this.telephone = telephone;
        this.birthDate = birthDate;
    }

    // methods

    @Override
    public String toString() {
        return "Client{" +
                "clientId=" + clientId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", mail='" + mail + '\'' +
                ", telephone=" + telephone +
                ", birthDate=" + birthDate +
                '}';
    }
}
