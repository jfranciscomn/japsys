<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'gasto-operativo-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'sueldos'); ?>">
		<?php echo $form->labelEx($model,'sueldos'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'sueldos'); ?>
			<?php echo $form->error($model,'sueldos'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'honorarios'); ?>">
		<?php echo $form->labelEx($model,'honorarios'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'honorarios'); ?>
			<?php echo $form->error($model,'honorarios'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'combustibles'); ?>">
		<?php echo $form->labelEx($model,'combustibles'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'combustibles'); ?>
			<?php echo $form->error($model,'combustibles'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'luzTelefono'); ?>">
		<?php echo $form->labelEx($model,'luzTelefono'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'luzTelefono'); ?>
			<?php echo $form->error($model,'luzTelefono'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'papeleria'); ?>">
		<?php echo $form->labelEx($model,'papeleria'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'papeleria'); ?>
			<?php echo $form->error($model,'papeleria'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'renta'); ?>">
		<?php echo $form->labelEx($model,'renta'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'renta'); ?>
			<?php echo $form->error($model,'renta'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'impuestosDerechos'); ?>">
		<?php echo $form->labelEx($model,'impuestosDerechos'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'impuestosDerechos'); ?>
			<?php echo $form->error($model,'impuestosDerechos'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'otros'); ?>">
		<?php echo $form->labelEx($model,'otros'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'otros'); ?>
			<?php echo $form->error($model,'otros'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'institucion_aid'); ?>">
		<?php echo $form->labelEx($model,'institucion_aid'); ?>
		<div class="input">
			
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
					      'model'=>$model, 
					      'attribute'=>'institucion_aid', 
					      'sourceUrl'=>Yii::app()->createUrl('institucion/autocompletesearch'), 
					      'showFKField'=>false,
					      'relName'=>'institucion', // the relation name defined above
					      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

					      'options'=>array(
					          'minLength'=>1, 
					      ),
					 )); ?>			<?php echo $form->error($model,'institucion_aid'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ejercicioFiscal_did'); ?>">
		<?php echo $form->labelEx($model,'ejercicioFiscal_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,ejercicioFiscal_did,CHtml::listData(EjercicioFiscal::model()->findAll(), 'id', 'nombre')); ?>			<?php echo $form->error($model,'ejercicioFiscal_did'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus_did'); ?>">
		<?php echo $form->labelEx($model,'estatus_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,estatus_did,CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>			<?php echo $form->error($model,'estatus_did'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'editable'); ?>">
		<?php echo $form->labelEx($model,'editable'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'editable'); ?>
			<?php echo $form->error($model,'editable'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ultimaModificacion_dt'); ?>">
		<?php echo $form->labelEx($model,'ultimaModificacion_dt'); ?>
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
					                                       ),)); ?>			<?php echo $form->error($model,'ultimaModificacion_dt'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->