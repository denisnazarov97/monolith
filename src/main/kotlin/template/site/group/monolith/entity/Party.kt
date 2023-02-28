package template.site.group.monolith.entity

import javax.persistence.*


@Entity
@Table(name = "party")
class Party(
    @Id
    val name: String,
    @Column
    val image: String,
    @Column
    val description: String,
    @ManyToOne
    @JoinColumn(name = "owner_id")
    val owner : Client
)