package template.site.group.monolith.entity

import java.util.UUID
import javax.persistence.*


@Entity
@Table(name = "review")
data class Review(
    @Id
    @GeneratedValue
    val id: UUID? = null,
    @Column
    val content: String,
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "owner_id", referencedColumnName = "id", nullable = false)
    val owner: Client,
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "game_name", referencedColumnName = "name", nullable = false)
    val game: Game,
    @Column
    val vote: Int,
)
