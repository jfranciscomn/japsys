<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'ingreso-por-evento-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'colectas'); ?>">
		<?php echo $form->labelEx($model,'colectas'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'colectas'); ?>
			<?php echo $form->error($model,'colectas'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'eventos'); ?>">
		<?php echo $form->labelEx($model,'eventos'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'eventos'); ?>
			<?php echo $form->error($model,'eventos'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'rifas'); ?>">
		<?php echo $form->labelEx($model,'rifas'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'rifas'); ?>
			<?php echo $form->error($model,'rifas'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'desayunos'); ?>">
		<?php echo $form->labelEx($model,'desayunos'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'desayunos'); ?>
			<?php echo $form->error($model,'desayunos'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'conferencias'); ?>">
		<?php echo $form->labelEx($model,'conferencias'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'conferencias'); ?>
			<?php echo $form->error($model,'conferencias'); ?>
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