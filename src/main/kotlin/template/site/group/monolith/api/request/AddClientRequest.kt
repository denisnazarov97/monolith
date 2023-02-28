package template.site.group.monolith.api.request

data class AddClientRequest(
    val clientName: String,
    val email: String,
    val password: String
)