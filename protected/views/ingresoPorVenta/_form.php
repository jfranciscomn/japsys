<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'ingreso-por-venta-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'id'); ?>">
		<?php echo $form->labelEx($model,'id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'id'); ?>
			<?php echo $form->error($model,'id'); ?>
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