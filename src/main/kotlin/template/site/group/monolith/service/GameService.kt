package template.site.group.monolith.service

import org.springframework.stereotype.Service
import template.site.group.monolith.repository.GameRepository
import template.site.group.monolith.api.request.AddGameRequest
import template.site.group.monolith.api.request.FindGameRequest
import template.site.group.monolith.api.response.GameResponse
import template.site.group.monolith.entity.Game
import template.site.group.monolith.repository.GameWithReviewRepository

@Service
class GameService(
    private val gameWithReviewRepository: GameWithReviewRepository,
    private val gameRepository: GameRepository
) {
    fun addGame(request: AddGameRequest){
        val entity = Game(request.name, 3.14f, "single",
            false, false, true, true)
        gameRepository.save(entity)
    }

    fun findGameWithReview(request: FindGameRequest): GameResponse{
        val entity = gameWithReviewRepository.findByName(request.gameName)
        return GameResponse(name = entity.name, price = entity.price,
            mode = entity.mode,
            isMmo = entity.isMmo, isCoopNet = entity.isCoopNet,
            isCoopLan = entity.isCoopLan, isSingle = entity.isSingle,
            genres = entity.genres, reviews = entity.reviews)

    }

    fun findGameWithOutReview(request: FindGameRequest): GameResponse {
        val entity = gameRepository.findByName(request.gameName)
        return GameResponse(name = entity.name, price = entity.price,
            mode = entity.mode,
            isMmo = entity.isMmo, isCoopNet = entity.isCoopNet,
            isCoopLan = entity.isCoopLan, isSingle = entity.isSingle,
            genres = entity.genres)
    }

}