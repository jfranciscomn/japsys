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
		<?php echo $form->label($model,'sueldos'); ?>
		<div class="input">
			<?php echo $form->textField($model,'sueldos'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'honorarios'); ?>
		<div class="input">
			<?php echo $form->textField($model,'honorarios'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'combustibles'); ?>
		<div class="input">
			<?php echo $form->textField($model,'combustibles'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'luzTelefono'); ?>
		<div class="input">
			<?php echo $form->textField($model,'luzTelefono'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'papeleria'); ?>
		<div class="input">
			<?php echo $form->textField($model,'papeleria'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'renta'); ?>
		<div class="input">
			<?php echo $form->textField($model,'renta'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'impuestosDerechos'); ?>
		<div class="input">
			<?php echo $form->textField($model,'impuestosDerechos'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'otros'); ?>
		<div class="input">
			<?php echo $form->textField($model,'otros'); ?>
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