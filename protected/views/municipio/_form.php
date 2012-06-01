<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'municipio-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'clave'); ?>">
		<?php echo $form->labelEx($model,'clave'); ?>
		<div class="input">
			<?php echo $form->textField($model,'clave',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'clave'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'nombre'); ?>">
		<?php echo $form->labelEx($model,'nombre'); ?>
		<div class="input">
			<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>145)); ?>
			<?php echo $form->error($model,'nombre'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estado_id'); ?>">
		<?php echo $form->labelEx($model,'estado_id'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'estado_id',CHtml::listData(Estado::model()->findAll(), 'id', 'nombre')); ?>
			<?php echo $form->error($model,'estado_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus'); ?>">
		<?php echo $form->labelEx($model,'estatus'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'estatus',CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>
			<?php echo $form->error($model,'estatus'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->