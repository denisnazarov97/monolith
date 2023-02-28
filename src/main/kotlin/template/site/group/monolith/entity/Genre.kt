package template.site.group.monolith.entity

import javax.persistence.*

@Entity
@Table(name = "genre")
data class Genre(
    @Id
    val name: String
)
