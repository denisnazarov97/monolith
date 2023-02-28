package template.site.group.monolith.service

import org.springframework.stereotype.Service
import template.site.group.monolith.api.request.AddClientRequest
import template.site.group.monolith.entity.Client
import template.site.group.monolith.repository.ClientRepository

@Service
class ClientService(
    private val clientRepository: ClientRepository
) {
    fun addClient(request: AddClientRequest){
        val entity = Client(
            name = request.clientName,
            email = request.email,
            password = request.password)
        clientRepository.save(entity)
    }
}