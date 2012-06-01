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
		<?php echo $form->label($model,'nombre'); ?>
		<div class="input">
			<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>145)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'siglas'); ?>
		<div class="input">
			<?php echo $form->textField($model,'siglas',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'mision'); ?>
		<div class="input">
			<?php echo $form->textArea($model,'mision',array('rows'=>6, 'cols'=>50)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'vision'); ?>
		<div class="input">
			<?php echo $form->textArea($model,'vision',array('rows'=>6, 'cols'=>50)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'domicio_direccion'); ?>
		<div class="input">
			<?php echo $form->textField($model,'domicio_direccion',array('size'=>60,'maxlength'=>145)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'domicilio_cp'); ?>
		<div class="input">
			<?php echo $form->textField($model,'domicilio_cp',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>


	<div class="clearfix">
		<?php echo $form->label($model,'domicilio_municipio_id'); ?>
		<div class="input">
			<?php echo $form->textField($model,'domicilio_municipio_id'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'contacto_telefono'); ?>
		<div class="input">
			<?php echo $form->textField($model,'contacto_telefono',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'contacto_fax'); ?>
		<div class="input">
			<?php echo $form->textField($model,'contacto_fax',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'contacto_email'); ?>
		<div class="input">
			<?php echo $form->textField($model,'contacto_email',array('size'=>60,'maxlength'=>145)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fecha_constitucion'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fecha_constitucion'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fecha_transformacion'); ?>
		<div class="input">
			<?php echo $form->textField($model,'fecha_transformacion'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'rfc'); ?>
		<div class="input">
			<?php echo $form->textField($model,'rfc',array('size'=>13,'maxlength'=>13)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'donativo_deducible'); ?>
		<div class="input">
			<?php echo $form->textField($model,'donativo_deducible'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'donativo_convenio'); ?>
		<div class="input">
			<?php echo $form->textField($model,'donativo_convenio'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'cluni'); ?>
		<div class="input">
			<?php echo $form->textField($model,'cluni',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ambito_id'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'ambito_id',CHtml::listData(Ambito::model()->findAll(), 'id', 'nombre')); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'areageografica_id'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'areageografica_id',CHtml::listData(AreaGeografica::model()->findAll(), 'id', 'nombre')); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'horas_promedio_trabajador'); ?>
		<div class="input">
			<?php echo $form->textField($model,'horas_promedio_trabajador'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'estatus'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'estatus',CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->