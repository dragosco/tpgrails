package grails_tp

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured('IS_AUTHENTICATED_FULLY')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model:[groupeInstanceCount: Groupe.count()]
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def show(Groupe groupeInstance) {
        respond groupeInstance
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    def create() {
        respond new Groupe(params)
    }

    @Transactional
    def save(Groupe groupeInstance) {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view:'create'
            return
        }

        groupeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    def edit(Groupe groupeInstance) {
        respond groupeInstance
    }

    @Transactional
    def update(Groupe groupeInstance) {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view:'edit'
            return
        }

        groupeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*'{ respond groupeInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def delete(Groupe groupeInstance) {

        if (groupeInstance == null) {
            notFound()
            return
        }

        groupeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
