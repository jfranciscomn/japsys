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
		<?php echo $form->label($model,'domicioDireccion'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'domicioDireccion',array('size'=>60,'maxlength'=>145)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'domicilioCP'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'domicilioCP',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'municipio_aid'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'municipio_aid'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'contactoTelefono'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'contactoTelefono',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'contactoFax'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'contactoFax',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'contactoEmail'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'contactoEmail',array('size'=>60,'maxlength'=>145)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fechaConstitucion_dt'); ?>
		<div class="input">
			
			<?php
					if ($fechaConstitucion_dt!='') 
						$fechaConstitucion_dt=date('d-m-Y',strtotime($fechaConstitucion_dt));
					$this->widget('zii.widgets.jui.CJuiDatePicker', array(
					                                       'model'=>$model,
					                                       'attribute'=>'fechaConstitucion_dt',
					                                       'value'=>$fechaConstitucion_dt,
					                                       'language' => 'es',
					                                       'htmlOptions' => array('readonly'=>"readonly"),
					                                       'options'=>array(
					                                               'autoSize'=>true,
					                                               'defaultDate'=>$fechaConstitucion_dt,
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
					                                       ),)); ?>		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'fechaTransformacion_dt'); ?>
		<div class="input">
			
			<?php
					if ($fechaTransformacion_dt!='') 
						$fechaTransformacion_dt=date('d-m-Y',strtotime($fechaTransformacion_dt));
					$this->widget('zii.widgets.jui.CJuiDatePicker', array(
					                                       'model'=>$model,
					                                       'attribute'=>'fechaTransformacion_dt',
					                                       'value'=>$fechaTransformacion_dt,
					                                       'language' => 'es',
					                                       'htmlOptions' => array('readonly'=>"readonly"),
					                                       'options'=>array(
					                                               'autoSize'=>true,
					                                               'defaultDate'=>$fechaTransformacion_dt,
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
					                                       ),)); ?>		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'rfc'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'rfc',array('size'=>13,'maxlength'=>13)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'donativoDeducible'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'donativoDeducible'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'donativoConvenio'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'donativoConvenio'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'cluni'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'cluni',array('size'=>45,'maxlength'=>45)); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ambito_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,ambito_did,CHtml::listData(Ambito::model()->findAll(), 'id', 'nombre')); ?>		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'areaGeografica_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,areaGeografica_did,CHtml::listData(AreaGeografica::model()->findAll(), 'id', 'nombre')); ?>		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'horasPromedio_trabajador'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'horasPromedio_trabajador'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'estatus_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,estatus_did,CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->