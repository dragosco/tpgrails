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
		<g:each in="${listSuperGroupes}" var="g">
			<div class="col-md-6 no-padding">

					<div class="row no-margin img-wrapper">
						<img class="groupe-img" src=${grailsApplication.config.images.groupes.url}${g.photo.nom}>
						<g:link controller="groupe" action="show" id="${g.id}">
							<div class="img-description">
								<span class="img-span">${g.nom}</span>
							</div>
						</g:link>
					</div>


			</div>
		</g:each>
	</div>
	</body>
</html>
