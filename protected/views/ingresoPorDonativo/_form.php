<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'ingreso-por-donativo-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'personaFisica'); ?>">
		<?php echo $form->labelEx($model,'personaFisica'); ?>
		<div class="input">
			<?php echo $form->textField($model,'personaFisica'); ?>
			<?php echo $form->error($model,'personaFisica'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'personaMoral'); ?>">
		<?php echo $form->labelEx($model,'personaMoral'); ?>
		<div class="input">
			<?php echo $form->textField($model,'personaMoral'); ?>
			<?php echo $form->error($model,'personaMoral'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fundacionesNacionales'); ?>">
		<?php echo $form->labelEx($model,'fundacionesNacionales'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fundacionesNacionales'); ?>
			<?php echo $form->error($model,'fundacionesNacionales'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fundacionesExtrajeras'); ?>">
		<?php echo $form->labelEx($model,'fundacionesExtrajeras'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fundacionesExtrajeras'); ?>
			<?php echo $form->error($model,'fundacionesExtrajeras'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fondosGubernamentales'); ?>">
		<?php echo $form->labelEx($model,'fondosGubernamentales'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fondosGubernamentales'); ?>
			<?php echo $form->error($model,'fondosGubernamentales'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'especie'); ?>">
		<?php echo $form->labelEx($model,'especie'); ?>
		<div class="input">
			<?php echo $form->textField($model,'especie'); ?>
			<?php echo $form->error($model,'especie'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'institucion_id'); ?>">
		<?php echo $form->labelEx($model,'institucion_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'institucion_id'); ?>
			<?php echo $form->error($model,'institucion_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ejercicio_id'); ?>">
		<?php echo $form->labelEx($model,'ejercicio_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'ejercicio_id'); ?>
			<?php echo $form->error($model,'ejercicio_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus_id'); ?>">
		<?php echo $form->labelEx($model,'estatus_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'estatus_id'); ?>
			<?php echo $form->error($model,'estatus_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'editable'); ?>">
		<?php echo $form->labelEx($model,'editable'); ?>
		<div class="input">
			<?php echo $form->textField($model,'editable'); ?>
			<?php echo $form->error($model,'editable'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ultimaModificacion'); ?>">
		<?php echo $form->labelEx($model,'ultimaModificacion'); ?>
		<div class="input">
			<?php echo $form->textField($model,'ultimaModificacion'); ?>
			<?php echo $form->error($model,'ultimaModificacion'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->