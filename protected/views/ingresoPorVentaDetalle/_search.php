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
		<?php echo $form->label($model,'concepto'); ?>
		<div class="input">
			<?php echo $form->textField($model,'concepto',array('size'=>60,'maxlength'=>150)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'cantidad'); ?>
		<div class="input">
			<?php echo $form->textField($model,'cantidad'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ingresoPorVenta_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'ingresoPorVenta_id'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'estatus_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'estatus_id'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->