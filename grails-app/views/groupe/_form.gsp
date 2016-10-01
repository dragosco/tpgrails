<%@ page import="grails_tp.Groupe" %>


<div class="input-group fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="groupe.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>

	<g:textField class="form-control" name="nom" required="" value="${groupeInstance?.nom}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="groupe.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${groupeInstance.list()}" optionKey="id" required="" value="${groupeInstance?.parent?.id}" class="many-to-one" optionValue="nom"/>

</div>


<div>
	<label>Photo groupe</label>
	<input type="file" name="image" id="photo" />
</div>

