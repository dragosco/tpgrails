
<%@ page import="grails_tp.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-groupe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupe">
			
				<g:if test="${groupeInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="groupe.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${groupeInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.activites}">
				<li class="fieldcontain">
					<span id="activites-label" class="property-label"><g:message code="groupe.activites.label" default="Activites" /></span>
					
						<g:each in="${groupeInstance.activites}" var="a">
						<span class="property-value" aria-labelledby="activites-label"><g:link controller="activite" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.auteur}">
				<li class="fieldcontain">
					<span id="auteur-label" class="property-label"><g:message code="groupe.auteur.label" default="Auteur" /></span>
					
						<span class="property-value" aria-labelledby="auteur-label"><g:link controller="user" action="show" id="${groupeInstance?.auteur?.id}">${groupeInstance?.auteur?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.groupes}">
				<li class="fieldcontain">
					<span id="groupes-label" class="property-label"><g:message code="groupe.groupes.label" default="Groupes" /></span>
					
						<g:each in="${groupeInstance.groupes}" var="g">
						<span class="property-value" aria-labelledby="groupes-label"><g:link controller="groupe" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="groupe.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="groupe" action="show" id="${groupeInstance?.parent?.id}">${groupeInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="groupe.photo.label" default="Photo" /></span>
					
						<span class="property-value" aria-labelledby="photo-label"><g:link controller="photo" action="show" id="${groupeInstance?.photo?.id}">${groupeInstance?.photo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${groupeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>