package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import template.site.group.monolith.entity.Party

interface PartyRepository: JpaRepository <Party, String> {
}