package template.site.group.monolith.entity

import java.util.*
import javax.persistence.*

@Entity
@Table(name = "client")
data class Client(
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: UUID? = null,

    @Column
    val name: String,

    @Column
    val email: String,

    @Column
    val password: String,

    @ManyToMany
    @JoinTable(
        name = "client2game",
        joinColumns = [JoinColumn(
            name = "client_id",
            referencedColumnName = "id",
            insertable = false,
            updatable = false,
        )],
        inverseJoinColumns = [JoinColumn(
            name = "game_name",
            referencedColumnName = "name",
            insertable = false,
            updatable = false,
        )]
    )
    val games: List<GameWithReview> = listOf()

)