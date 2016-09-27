package grails_tp


import grails.transaction.Transactional


@Transactional
class UserService {

    def createUser (String username, String password, Role role) {
        def user = new User(username: username, password: password).save(flush: true, failOnError: true)
        UserRole.create(user, role)

        return user
    }
}
