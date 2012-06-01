<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'usuario-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'usuario'); ?>">
		<?php echo $form->labelEx($model,'usuario'); ?>
		<div class="input">
			<?php echo $form->textField($model,'usuario',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'usuario'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'password'); ?>">
		<?php echo $form->labelEx($model,'password'); ?>
		<div class="input">
			<?php echo $form->passwordField($model,'password',array('size'=>60,'maxlength'=>150)); ?>
			<?php echo $form->error($model,'password'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'tipousuario_id'); ?>">
		<?php echo $form->labelEx($model,'tipousuario_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'tipousuario_id'); ?>
			<?php echo $form->error($model,'tipousuario_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'institucion_id'); ?>">
		<?php echo $form->labelEx($model,'institucion_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'institucion_id'); ?>
			<?php echo $form->error($model,'institucion_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus'); ?>">
		<?php echo $form->labelEx($model,'estatus'); ?>
		<div class="input">
			<?php echo $form->textField($model,'estatus'); ?>
			<?php echo $form->error($model,'estatus'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->