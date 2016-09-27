<%@ page import="grails_tp.Groupe" %>



<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="groupe.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${groupeInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'activites', 'error')} ">
	<label for="activites">
		<g:message code="groupe.activites.label" default="Activites" />
		
	</label>
	<g:select name="activites" from="${grails_tp.Activite.list()}" multiple="multiple" optionKey="id" size="5" value="${groupeInstance?.activites*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'auteur', 'error')} required">
	<label for="auteur">
		<g:message code="groupe.auteur.label" default="Auteur" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="auteur" name="auteur.id" from="${grails_tp.User.list()}" optionKey="id" required="" value="${groupeInstance?.auteur?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'groupes', 'error')} ">
	<label for="groupes">
		<g:message code="groupe.groupes.label" default="Groupes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${groupeInstance?.groupes?}" var="g">
    <li><g:link controller="groupe" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="groupe" action="create" params="['groupe.id': groupeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'groupe.label', default: 'Groupe')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="groupe.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${grails_tp.Groupe.list()}" optionKey="id" required="" value="${groupeInstance?.parent?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="groupe.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="photo" name="photo.id" from="${grails_tp.Photo.list()}" optionKey="id" required="" value="${groupeInstance?.photo?.id}" class="many-to-one"/>

</div>

