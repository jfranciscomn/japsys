<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'institucion-form',
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

	<div class="<?php echo $form->fieldClass($model, 'siglas'); ?>">
		<?php echo $form->labelEx($model,'siglas'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'siglas',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'siglas'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'mision'); ?>">
		<?php echo $form->labelEx($model,'mision'); ?>
		<div class="input">
			
			<?php echo $form->textArea($model,'mision',array('rows'=>6, 'cols'=>50)); ?>
			<?php echo $form->error($model,'mision'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'vision'); ?>">
		<?php echo $form->labelEx($model,'vision'); ?>
		<div class="input">
			
			<?php echo $form->textArea($model,'vision',array('rows'=>6, 'cols'=>50)); ?>
			<?php echo $form->error($model,'vision'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'domicioDireccion'); ?>">
		<?php echo $form->labelEx($model,'domicioDireccion'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'domicioDireccion',array('size'=>60,'maxlength'=>145)); ?>
			<?php echo $form->error($model,'domicioDireccion'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'domicilioCP'); ?>">
		<?php echo $form->labelEx($model,'domicilioCP'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'domicilioCP',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'domicilioCP'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'municipio_aid'); ?>">
		<?php echo $form->labelEx($model,'municipio_aid'); ?>
		<div class="input">
			
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
					      'model'=>$model, 
					      'attribute'=>'municipio_aid', 
					      'sourceUrl'=>Yii::app()->createUrl('municipio/autocompletesearch'), 
					      'showFKField'=>false,
					      'relName'=>'municipio', // the relation name defined above
					      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

					      'options'=>array(
					          'minLength'=>1, 
					      ),
					 )); ?>			<?php echo $form->error($model,'municipio_aid'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'contactoTelefono'); ?>">
		<?php echo $form->labelEx($model,'contactoTelefono'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'contactoTelefono',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'contactoTelefono'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'contactoFax'); ?>">
		<?php echo $form->labelEx($model,'contactoFax'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'contactoFax',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'contactoFax'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'contactoEmail'); ?>">
		<?php echo $form->labelEx($model,'contactoEmail'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'contactoEmail',array('size'=>60,'maxlength'=>145)); ?>
			<?php echo $form->error($model,'contactoEmail'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fechaConstitucion_dt'); ?>">
		<?php echo $form->labelEx($model,'fechaConstitucion_dt'); ?>
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
					                                       ),)); ?>			<?php echo $form->error($model,'fechaConstitucion_dt'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fechaTransformacion_dt'); ?>">
		<?php echo $form->labelEx($model,'fechaTransformacion_dt'); ?>
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
					                                       ),)); ?>			<?php echo $form->error($model,'fechaTransformacion_dt'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'rfc'); ?>">
		<?php echo $form->labelEx($model,'rfc'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'rfc',array('size'=>13,'maxlength'=>13)); ?>
			<?php echo $form->error($model,'rfc'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'donativoDeducible'); ?>">
		<?php echo $form->labelEx($model,'donativoDeducible'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'donativoDeducible'); ?>
			<?php echo $form->error($model,'donativoDeducible'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'donativoConvenio'); ?>">
		<?php echo $form->labelEx($model,'donativoConvenio'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'donativoConvenio'); ?>
			<?php echo $form->error($model,'donativoConvenio'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'cluni'); ?>">
		<?php echo $form->labelEx($model,'cluni'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'cluni',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'cluni'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ambito_did'); ?>">
		<?php echo $form->labelEx($model,'ambito_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,ambito_did,CHtml::listData(Ambito::model()->findAll(), 'id', 'nombre')); ?>			<?php echo $form->error($model,'ambito_did'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'areaGeografica_did'); ?>">
		<?php echo $form->labelEx($model,'areaGeografica_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,areaGeografica_did,CHtml::listData(AreaGeografica::model()->findAll(), 'id', 'nombre')); ?>			<?php echo $form->error($model,'areaGeografica_did'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'horasPromedio_trabajador'); ?>">
		<?php echo $form->labelEx($model,'horasPromedio_trabajador'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'horasPromedio_trabajador'); ?>
			<?php echo $form->error($model,'horasPromedio_trabajador'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus_did'); ?>">
		<?php echo $form->labelEx($model,'estatus_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,estatus_did,CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>			<?php echo $form->error($model,'estatus_did'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->