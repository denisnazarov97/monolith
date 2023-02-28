package template.site.group.monolith.entity

import java.time.LocalDate
import java.util.UUID
import javax.persistence.*


@Entity
@Table(name = "client_profile")
data class ClientProfile(
    @Id
    @GeneratedValue
    val id : UUID? = null,
    @Column
    val name : String,
    @Column
    val surname: String,
    @OneToOne(fetch = FetchType.LAZY, optional = false) // TODO @OneToOne(cascade = [CascadeType.ALL], orphanRemoval = true)
    @JoinColumn(name = "client_id", referencedColumnName = "id", nullable = false)
    val client: Client,
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "favorite_genre_name", referencedColumnName = "name")
    val favoriteGenre: Genre,
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "favorite_game_name", referencedColumnName = "name")
    val favoriteGame: GameWithReview,
    @Column(name = "creation_date")
    val creationDate: LocalDate
)
