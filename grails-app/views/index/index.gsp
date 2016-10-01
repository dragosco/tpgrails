<%@ page import="grails_tp.GroupeService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav"/>
		<title>Welcome to Grails</title>
		<r:require modules="bootstrap"/>
	</head>
	<body>


	<div class="container">
		<ul class="list-group">
			<g:each in="${listSuperGroupes}" var="groupeInstance">
				<li class="list-group-item">
					<img src=${grailsApplication.config.images.groupes.url}${groupeInstance.photo.nom} style="width:100px">

					<a href="${createLink(uri: '/groupe/show/')}${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nom")}</a>

					${fieldValue(bean: groupeInstance, field: "auteur")}

					${fieldValue(bean: groupeInstance, field: "parent")}
				</li>
			</g:each>
		</ul>
	</div>
	</body>
</html>
