package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import template.site.group.monolith.entity.Review
import java.util.UUID

interface ReviewRepository: JpaRepository <Review, UUID> {
}