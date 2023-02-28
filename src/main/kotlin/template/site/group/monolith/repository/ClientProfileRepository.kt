package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import template.site.group.monolith.entity.ClientProfile
import java.util.UUID

@Repository
interface ClientProfileRepository : JpaRepository <ClientProfile, UUID>{
}