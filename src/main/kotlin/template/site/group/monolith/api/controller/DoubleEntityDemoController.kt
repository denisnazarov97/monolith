package template.site.group.monolith.api.controller

import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import template.site.group.monolith.api.request.AddClientRequest
import template.site.group.monolith.api.request.AddGameRequest
import template.site.group.monolith.api.request.AddReviewRequest
import template.site.group.monolith.api.request.FindGameRequest
import template.site.group.monolith.api.response.GameResponse
import template.site.group.monolith.service.ClientService
import template.site.group.monolith.service.GameService
import template.site.group.monolith.service.ReviewService

@RestController
class DoubleEntityDemoController(
    private val gameService: GameService,
    private val reviewService: ReviewService,
    private val clientService: ClientService
) {

    private val log = LoggerFactory.getLogger(DoubleEntityDemoController::class.java)

    @GetMapping("/addGame")
    fun addGame(@RequestBody request: AddGameRequest): ResponseEntity<Unit> {
        gameService.addGame(request)
        return ResponseEntity.status(HttpStatus.OK).build()
    }

    @GetMapping("/addReview")
    fun addReview(@RequestBody request: AddReviewRequest): ResponseEntity<Unit>{
        reviewService.addReviews(request)
        return ResponseEntity.status(HttpStatus.OK).build()
    }

    @GetMapping("/getGameWithReview")
    fun getGameWithReview(@RequestBody request: FindGameRequest): ResponseEntity<Unit>{
        val time = System.nanoTime()
        val game = gameService.findGameWithReview(request)
        log.info("Game finded with review by {} nano", System.nanoTime() - time)
        return ResponseEntity.status(HttpStatus.OK).build()
    }

    @GetMapping("/getGameWithOutReview")
    fun getGameWithOutReview(@RequestBody request: FindGameRequest): ResponseEntity<Unit>{
        val time = System.nanoTime()
        val game = gameService.findGameWithOutReview(request)
        log.info("Game finded  without review by {} nano", System.nanoTime() - time)
        return ResponseEntity.status(HttpStatus.OK).build()
    }
    @GetMapping("/addClient")
    fun addClient(@RequestBody request: AddClientRequest): ResponseEntity<Unit>{
        clientService.addClient(request)
        return ResponseEntity.status(HttpStatus.OK).build()
    }



}