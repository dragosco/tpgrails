<%@ page import="grails_tp.GroupeService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>

	</head>
	<body>
	<div class="nav" role="navigation">
		<ul>
			<li><a href="${createLink(uri: '/logout')}">LOGOUT</a></li>
		</ul>
	</div>
	<div>
		<ul class="list-group">
			<g:each in="${listSuperGroupes}" var="groupeInstance">
				<li class="list-group-item"><img src="${grailsApplication.config.images.url}${grailsApplication.config.images.groupes.path}${groupeInstance.photo.nom}" style="width:100px">

				<a href="groupe/show/${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nom")}</a>

				${fieldValue(bean: groupeInstance, field: "auteur")}

				${fieldValue(bean: groupeInstance, field: "parent")}</li>
			</g:each>
		</ul>
	</div>
	</body>
</html>