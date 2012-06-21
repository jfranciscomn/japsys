<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'ejercicio-fiscal-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'nombre'); ?>">
		<?php echo $form->labelEx($model,'nombre'); ?>
		<div class="input">
			<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>145)); ?>
			<?php echo $form->error($model,'nombre'); ?>
		</div>
	</div>
	
	<div class="<?php echo $form->fieldClass($model, 'fecha_inicio'); ?>">
		<?php echo $form->labelEx($model,'fecha_inicio'); ?>
		<div class="input">
			<?php 
				if ($model->fecha_inicio!='') $model->fecha_inicio=date('d-m-Y',strtotime($model->fecha_inicio));
				$this->widget('zii.widgets.jui.CJuiDatePicker', array(
				                                       'model'=>$model,
				                                       'attribute'=>'fecha_inicio',
				                                       'value'=>$model->fecha_inicio,
				                                       'language' => 'es',
				                                       'htmlOptions' => array('readonly'=>"readonly"),
				                                       'options'=>array(
				                                               'autoSize'=>true,
				                                               'defaultDate'=>$model->fecha_inicio,
				                                               'dateFormat'=>'yy-mm-dd',
				                                               'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
				                                               'buttonImageOnly'=>true,
				                                               'buttonText'=>'Fecha',
				                                               'selectOtherMonths'=>true,
				                                               'showAnim'=>'slide',
				                                               'showButtonPanel'=>true,
				                                               'showOn'=>'button',
				                                               'showOtherMonths'=>true,
				                                               'changeMonth' => 'true',
				                                               'changeYear' => 'true',
				                                               'minDate'=>"-70Y", //fecha minima
				                                               'maxDate'=> "+10Y", //fecha maxima
				                                       ),));

			?>
			<?php echo $form->error($model,'fecha_inicio'); ?>
		</div>
	</div>

	
	<div class="<?php echo $form->fieldClass($model, 'fecha_fin'); ?>">
		<?php echo $form->labelEx($model,'fecha_fin'); ?>
		<div class="input">
			<?php 
				if ($model->fecha_fin!='') $model->fecha_fin=date('d-m-Y',strtotime($model->fecha_fin));
				$this->widget('zii.widgets.jui.CJuiDatePicker', array(
				                                       'model'=>$model,
				                                       'attribute'=>'fecha_fin',
				                                       'value'=>$model->fecha_fin,
				                                       'language' => 'es',
				                                       'htmlOptions' => array('readonly'=>"readonly"),
				                                       'options'=>array(
				                                               'autoSize'=>true,
				                                               'defaultDate'=>$model->fecha_fin,
				                                               'dateFormat'=>'yy-mm-dd',
				                                               'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
				                                               'buttonImageOnly'=>true,
				                                               'buttonText'=>'Fecha',
				                                               'selectOtherMonths'=>true,
				                                               'showAnim'=>'slide',
				                                               'showButtonPanel'=>true,
				                                               'showOn'=>'button',
				                                               'showOtherMonths'=>true,
				                                               'changeMonth' => 'true',
				                                               'changeYear' => 'true',
				                                               'minDate'=>"-70Y", //fecha minima
				                                               'maxDate'=> "+10Y", //fecha maxima
				                                       ),));

			?>
			<?php echo $form->error($model,'fecha_fin'); ?>
		</div>
	</div>
	
	
	<div class="<?php echo $form->fieldClass($model, 'estatus_id'); ?>">
		<?php echo $form->labelEx($model,'estatus_id'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'estatus_id',CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>
			<?php echo $form->error($model,'estatus_id'); ?>
		</div>
	</div>


	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->