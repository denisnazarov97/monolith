package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import template.site.group.monolith.entity.Game

interface GameRepository : JpaRepository<Game, String> {
    fun findByName(name: String): Game

    fun findByPrice(price: Float): Game
}