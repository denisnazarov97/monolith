package template.site.group.monolith.service

import jdk.jshell.spi.ExecutionControl.UserException
import org.springframework.stereotype.Service
import template.site.group.monolith.api.request.AddReviewRequest
import template.site.group.monolith.entity.Client
import template.site.group.monolith.entity.Game
import template.site.group.monolith.entity.Review
import template.site.group.monolith.repository.ClientRepository
import template.site.group.monolith.repository.GameRepository
import template.site.group.monolith.repository.ReviewRepository
import java.lang.RuntimeException

@Service
class ReviewService(
    private val reviewRepository: ReviewRepository,
    private val clientRepository: ClientRepository,
    private val gameRepository: GameRepository
) {

    fun addReviews(request: AddReviewRequest) {
        val client = clientRepository.findById(request.clientId)
            .orElseThrow{RuntimeException("User not found")}
        val game = gameRepository.findByName(request.gameName)
        for (i in 1..request.reviewsCount) {
            val entity = Review(
                content = "your game is shit",
                owner = client,
                game = game,
                vote = 0)
            reviewRepository.save(entity)
        }
    }
}
