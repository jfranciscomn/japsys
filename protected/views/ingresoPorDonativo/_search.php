<div class="wide form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="clearfix">
		<?php echo $form->label($model,'id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'id'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'personaFisica'); ?>
		<div class="input">
			<?php echo $form->textField($model,'personaFisica'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'personaMoral'); ?>
		<div class="input">
			<?php echo $form->textField($model,'personaMoral'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fundacionesNacionales'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fundacionesNacionales'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fundacionesExtrajeras'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fundacionesExtrajeras'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fondosGubernamentales'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fondosGubernamentales'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'especie'); ?>
		<div class="input">
			<?php echo $form->textField($model,'especie'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'institucion_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'institucion_id'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ejercicio_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'ejercicio_id'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'estatus_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'estatus_id'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'editable'); ?>
		<div class="input">
			<?php echo $form->textField($model,'editable'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ultimaModificacion'); ?>
		<div class="input">
			<?php echo $form->textField($model,'ultimaModificacion'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->