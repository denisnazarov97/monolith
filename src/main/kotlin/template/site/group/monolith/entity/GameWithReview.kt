package template.site.group.monolith.entity

import javax.persistence.*

@Entity
@Table(name = "game")
data class GameWithReview(
    @Id
    val name: String,
    @Column
    val price: Float,
    @Column
    val mode: String,
    @Column(name = "is_mmo")
    val isMmo: Boolean,
    @Column(name = "is_coop_net")
    val isCoopNet: Boolean,
    @Column(name = "is_coop_lan")
    val isCoopLan: Boolean,
    @Column(name = "is_single")
    val isSingle: Boolean,

    @OneToMany(cascade = [CascadeType.ALL], orphanRemoval = true)
    val reviews: List<Review> = listOf(),

    @ManyToMany
    @JoinTable(
        name = "genre2game",
        joinColumns = [JoinColumn(
            name = "game_name",
            referencedColumnName = "name",
            insertable = false,
            updatable = false,
        )],
        inverseJoinColumns = [JoinColumn(
            name = "genre_name",
            referencedColumnName = "name",
            insertable = false,
            updatable = false,
        )])
    val genres: List<Genre>
)
