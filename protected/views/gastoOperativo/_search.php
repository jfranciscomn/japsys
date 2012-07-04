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
		<?php echo $form->label($model,'institucion_aid'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'institucion_aid'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ejercicioFiscal_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,ejercicioFiscal_did,CHtml::listData(EjercicioFiscal::model()->findAll(), 'id', 'nombre')); ?>		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'estatus_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,estatus_did,CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'editable'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'editable'); ?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->label($model,'ultimaModificacion_dt'); ?>
		<div class="input">
			
			<?php
					if ($ultimaModificacion_dt!='') 
						$ultimaModificacion_dt=date('d-m-Y',strtotime($ultimaModificacion_dt));
					$this->widget('zii.widgets.jui.CJuiDatePicker', array(
					                                       'model'=>$model,
					                                       'attribute'=>'ultimaModificacion_dt',
					                                       'value'=>$ultimaModificacion_dt,
					                                       'language' => 'es',
					                                       'htmlOptions' => array('readonly'=>"readonly"),
					                                       'options'=>array(
					                                               'autoSize'=>true,
					                                               'defaultDate'=>$ultimaModificacion_dt,
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

	<div class="actions">
		<?php echo BHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->