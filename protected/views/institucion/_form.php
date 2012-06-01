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

	<div class="<?php echo $form->fieldClass($model, 'domicio_direccion'); ?>">
		<?php echo $form->labelEx($model,'domicio_direccion'); ?>
		<div class="input">
			<?php echo $form->textField($model,'domicio_direccion',array('size'=>60,'maxlength'=>145)); ?>
			<?php echo $form->error($model,'domicio_direccion'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'domicilio_cp'); ?>">
		<?php echo $form->labelEx($model,'domicilio_cp'); ?>
		<div class="input">
			<?php echo $form->textField($model,'domicilio_cp',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'domicilio_cp'); ?>
		</div>
	</div>



	<div class="<?php echo $form->fieldClass($model, 'domicilio_municipio_id'); ?>">
		<?php echo $form->labelEx($model,'domicilio_municipio_id'); ?>
		<div class="input">
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
			      'model'=>$model, 
			      'attribute'=>'domicilio_municipio_id', 
			      'sourceUrl'=>Yii::app()->createUrl('municipio/autocompletesearch'), 
			     'showFKField'=>false,
			      'relName'=>'domicilioMunicipio', // the relation name defined above
			      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

			      'options'=>array(
			          'minLength'=>1, 
			      ),
			 )); ?>
			<?php echo $form->error($model,'domicilio_municipio_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'contacto_telefono'); ?>">
		<?php echo $form->labelEx($model,'contacto_telefono'); ?>
		<div class="input">
			<?php echo $form->textField($model,'contacto_telefono',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'contacto_telefono'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'contacto_fax'); ?>">
		<?php echo $form->labelEx($model,'contacto_fax'); ?>
		<div class="input">
			<?php echo $form->textField($model,'contacto_fax',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'contacto_fax'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'contacto_email'); ?>">
		<?php echo $form->labelEx($model,'contacto_email'); ?>
		<div class="input">
			<?php echo $form->textField($model,'contacto_email',array('size'=>60,'maxlength'=>145)); ?>
			<?php echo $form->error($model,'contacto_email'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fecha_constitucion'); ?>">
		<?php echo $form->labelEx($model,'fecha_constitucion'); ?>
		<div class="input">
			<?php 
				if ($model->fecha_constitucion!='') $model->fecha_constitucion=date('d-m-Y',strtotime($model->fecha_constitucion));
				$this->widget('zii.widgets.jui.CJuiDatePicker', array(
				                                       'model'=>$model,
				                                       'attribute'=>'fecha_constitucion',
				                                       'value'=>$model->fecha_constitucion,
				                                       'language' => 'es',
				                                       'htmlOptions' => array('readonly'=>"readonly"),
				                                       'options'=>array(
				                                               'autoSize'=>true,
				                                               'defaultDate'=>$model->fecha_constitucion,
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
			<?php echo $form->error($model,'fecha_constitucion'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'fecha_transformacion'); ?>">
		<?php echo $form->labelEx($model,'fecha_transformacion'); ?>
		<div class="input">
			<?php 
				if ($model->fecha_transformacion!='') $model->fecha_transformacion=date('d-m-Y',strtotime($model->fecha_transformacion));
				$this->widget('zii.widgets.jui.CJuiDatePicker', array(
				                                       'model'=>$model,
				                                       'attribute'=>'fecha_transformacion',
				                                       'value'=>$model->fecha_transformacion,
				                                       'language' => 'es',
				                                       'htmlOptions' => array('readonly'=>"readonly"),
				                                       'options'=>array(
				                                               'autoSize'=>true,
				                                               'defaultDate'=>$model->fecha_constitucion,
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
			<?php echo $form->error($model,'fecha_transformacion'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'rfc'); ?>">
		<?php echo $form->labelEx($model,'rfc'); ?>
		<div class="input">
			<?php echo $form->textField($model,'rfc',array('size'=>13,'maxlength'=>13)); ?>
			<?php echo $form->error($model,'rfc'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'donativo_deducible'); ?>">
		<?php echo $form->labelEx($model,'donativo_deducible'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'donativo_deducible',array('1'=>'Autorizado', '2'=>'No Autorizado')); ?>
			<?php echo $form->error($model,'donativo_deducible'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'donativo_convenio'); ?>">
		<?php echo $form->labelEx($model,'donativo_convenio'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'donativo_convenio',array('1'=>'Autorizado', '2'=>'No Autorizado')); ?>
			<?php echo $form->error($model,'donativo_convenio'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'cluni'); ?>">
		<?php echo $form->labelEx($model,'cluni'); ?>
		<div class="input">
			<?php echo $form->textField($model,'cluni',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'cluni'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ambito_id'); ?>">
		<?php echo $form->labelEx($model,'ambito_id'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'ambito_id',CHtml::listData(Ambito::model()->findAll(), 'id', 'nombre')); ?>
			<?php echo $form->error($model,'ambito_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'areageografica_id'); ?>">
		<?php echo $form->labelEx($model,'areageografica_id'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'areageografica_id',CHtml::listData(AreaGeografica::model()->findAll(), 'id', 'nombre')); ?>
			<?php echo $form->error($model,'areageografica_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'horas_promedio_trabajador'); ?>">
		<?php echo $form->labelEx($model,'horas_promedio_trabajador'); ?>
		<div class="input">
			<?php echo $form->textField($model,'horas_promedio_trabajador'); ?>
			<?php echo $form->error($model,'horas_promedio_trabajador'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus'); ?>">
		<?php echo $form->labelEx($model,'estatus'); ?>
		<div class="input">
			<?php echo $form->dropDownList($model,'estatus',CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre')); ?>
			<?php echo $form->error($model,'estatus'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->