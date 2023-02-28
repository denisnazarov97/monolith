package template.site.group.monolith.repository

import org.springframework.data.jpa.repository.JpaRepository
import template.site.group.monolith.entity.Genre

interface GenreRepository: JpaRepository <Genre, String> {

}