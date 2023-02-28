package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import template.site.group.monolith.entity.Client
import java.util.*

@Repository
interface ClientRepository: JpaRepository <Client, UUID> {

    fun findByName(username: String): Optional<Client>

}