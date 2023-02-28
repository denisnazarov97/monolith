package template.site.group.monolith.api.response

import template.site.group.monolith.entity.Genre
import template.site.group.monolith.entity.Review
import javax.persistence.*

data class GameResponse(

    val name: String,

    val price: Float,

    val mode: String,

    val isMmo: Boolean,

    val isCoopNet: Boolean,

    val isCoopLan: Boolean,

    val isSingle: Boolean,

    val genres: List<Genre>,

    val reviews: List<Review> = listOf()
)
