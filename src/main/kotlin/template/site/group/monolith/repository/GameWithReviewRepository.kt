package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import template.site.group.monolith.entity.GameWithReview

interface GameWithReviewRepository: JpaRepository <GameWithReview, String> {

    fun findByName(name: String): GameWithReview

    fun findByPrice(price: Float): GameWithReview
//@Query(
//    """
//        select e from #{#Clientname} e join e.genres s where s.name in : genres
//    """
//)
//    fun findByGenre(@Param("genres") genres: List <String>): List<Game>
}