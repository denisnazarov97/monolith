package template.site.group.monolith.api.request

import java.util.UUID

data class AddReviewRequest(
    val clientId: UUID,
    val reviewsCount: Long,
    val gameName: String
)