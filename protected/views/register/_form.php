<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'registrar-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>


	<?php echo $form->errorSummary($usuario); ?>
	<?php echo $form->errorSummary($institucion); ?>
	<b>Datos del Usuario</b>
	<div class='well'>
		<div class="<?php echo $form->fieldClass($usuario, 'usuario'); ?>">
			<?php echo $form->labelEx($usuario,'usuario'); ?>
			<div class="input">
				<?php echo $form->textField($usuario,'usuario',array('size'=>60,'maxlength'=>145)); ?>
				<?php echo $form->error($usuario,'usuario'); ?>
			</div>
		</div>
		<div class="<?php echo $form->fieldClass($usuario, 'password'); ?>">
			<?php echo $form->labelEx($usuario,'password'); ?>
			<div class="input">
				<?php echo $form->textField($usuario,'password',array('size'=>60,'maxlength'=>145)); ?>
				<?php echo $form->error($usuario,'password'); ?>
			</div>
		</div>
	</div>
	
	<b>Datos Generales</b>
	<div class='well'>
		<div class='row-fluid show-grid'>
			<div class='span6'>
				<div class="<?php echo $form->fieldClass($institucion, 'nombre'); ?>">
					<?php echo $form->labelEx($institucion,'nombre'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'nombre',array('size'=>60,'maxlength'=>145)); ?>
						<?php echo $form->error($institucion,'nombre'); ?>
					</div>
				</div>
		
				<div class="<?php echo $form->fieldClass($institucion, 'siglas'); ?>">
					<?php echo $form->labelEx($institucion,'siglas'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'siglas',array('size'=>45,'maxlength'=>45)); ?>
						<?php echo $form->error($institucion,'siglas'); ?>
					</div>
				</div>
		
				<div class="<?php echo $form->fieldClass($institucion, 'rfc'); ?>">
					<?php echo $form->labelEx($institucion,'rfc'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'rfc',array('size'=>13,'maxlength'=>13)); ?>
						<?php echo $form->error($institucion,'rfc'); ?>
					</div>
				</div>
		
				<div class="<?php echo $form->fieldClass($institucion, 'cluni'); ?>">
					<?php echo $form->labelEx($institucion,'cluni'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'cluni',array('size'=>45,'maxlength'=>45)); ?>
						<?php echo $form->error($institucion,'cluni'); ?>
					</div>
				</div>
				<div class="<?php echo $form->fieldClass($institucion, 'ambito_id'); ?>">
					<?php echo $form->labelEx($institucion,'ambito_id'); ?>
					<div class="input">
						<?php echo $form->dropDownList($institucion,'ambito_id',CHtml::listData(Ambito::model()->findAll(), 'id', 'nombre')); ?>
						<?php echo $form->error($institucion,'ambito_id'); ?>
					</div>
				</div>

				<div class="<?php echo $form->fieldClass($institucion, 'areageografica_id'); ?>">
					<?php echo $form->labelEx($institucion,'areageografica_id'); ?>
					<div class="input">
						<?php echo $form->dropDownList($institucion,'areageografica_id',CHtml::listData(AreaGeografica::model()->findAll(), 'id', 'nombre')); ?>
						<?php echo $form->error($institucion,'areageografica_id'); ?>
					</div>
				</div>
				<div class="<?php echo $form->fieldClass($institucion, 'fecha_constitucion'); ?>">
					<?php echo $form->labelEx($institucion,'fecha_constitucion'); ?>
					<div class="input">
						<?php 
							if ($institucion->fecha_constitucion!='') $institucion->fecha_constitucion=date('d-m-Y',strtotime($institucion->fecha_constitucion));
							$this->widget('zii.widgets.jui.CJuiDatePicker', array(
							                                       'model'=>$institucion,
							                                       'attribute'=>'fecha_constitucion',
							                                       'value'=>$institucion->fecha_constitucion,
							                                       'language' => 'es',
							                                       'htmlOptions' => array('readonly'=>"readonly"),
							                                       'options'=>array(
							                                               'autoSize'=>true,
							                                               'defaultDate'=>$institucion->fecha_constitucion,
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
						<?php echo $form->error($institucion,'fecha_constitucion'); ?>
					</div>
				</div>

				<div class="<?php echo $form->fieldClass($institucion, 'fecha_transformacion'); ?>">
					<?php echo $form->labelEx($institucion,'fecha_transformacion'); ?>
					<div class="input">
						<?php 
							if ($institucion->fecha_transformacion!='') $institucion->fecha_transformacion=date('d-m-Y',strtotime($institucion->fecha_transformacion));
							$this->widget('zii.widgets.jui.CJuiDatePicker', array(
							                                       'model'=>$institucion,
							                                       'attribute'=>'fecha_transformacion',
							                                       'value'=>$institucion->fecha_transformacion,
							                                       'language' => 'es',
							                                       'htmlOptions' => array('readonly'=>"readonly"),
							                                       'options'=>array(
							                                               'autoSize'=>true,
							                                               'defaultDate'=>$institucion->fecha_constitucion,
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
						<?php echo $form->error($institucion,'fecha_transformacion'); ?>
					</div>
				</div>
			</div>
			<div class='span6'>
				
				<div class="<?php echo $form->fieldClass($institucion, 'donativo_deducible'); ?>">
					<?php echo $form->labelEx($institucion,'donativo_deducible'); ?>
					<div class="input">
						<?php echo $form->dropDownList($institucion,'donativo_deducible',array('1'=>'Autorizado', '2'=>'No Autorizado')); ?>
						<?php echo $form->error($institucion,'donativo_deducible'); ?>
					</div>
				</div>

				<div class="<?php echo $form->fieldClass($institucion, 'donativo_convenio'); ?>">
					<?php echo $form->labelEx($institucion,'donativo_convenio'); ?>
					<div class="input">
						<?php echo $form->dropDownList($institucion,'donativo_convenio',array('1'=>'Autorizado', '2'=>'No Autorizado')); ?>
						<?php echo $form->error($institucion,'donativo_convenio'); ?>
					</div>
				</div>

				<div class="<?php echo $form->fieldClass($institucion, 'mision'); ?>">
					<?php echo $form->labelEx($institucion,'mision'); ?>
					<div class="input">
						<?php echo $form->textArea($institucion,'mision',array('rows'=>6, 'cols'=>50)); ?>
						<?php echo $form->error($institucion,'mision'); ?>
					</div>
				</div>

				<div class="<?php echo $form->fieldClass($institucion, 'vision'); ?>">
					<?php echo $form->labelEx($institucion,'vision'); ?>
					<div class="input">
						<?php echo $form->textArea($institucion,'vision',array('rows'=>6, 'cols'=>50)); ?>
						<?php echo $form->error($institucion,'vision'); ?>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<b>Domicilio</b>
	<div class='well'>
		<div class='row-fluid show-grid'>
			<div class='span6'>

				<div class="<?php echo $form->fieldClass($institucion, 'domicio_direccion'); ?>">
					<?php echo $form->labelEx($institucion,'domicio_direccion'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'domicio_direccion',array('size'=>60,'maxlength'=>145)); ?>
						<?php echo $form->error($institucion,'domicio_direccion'); ?>
					</div>
				</div>
	

				<div class="<?php echo $form->fieldClass($institucion, 'domicilio_cp'); ?>">
					<?php echo $form->labelEx($institucion,'domicilio_cp'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'domicilio_cp',array('size'=>45,'maxlength'=>45)); ?>
						<?php echo $form->error($institucion,'domicilio_cp'); ?>
					</div>
				</div>
			</div>
			<div class='span6'>
				<div class="<?php echo $form->fieldClass($institucion, 'domicilio_municipio_id'); ?>">
					<?php echo $form->labelEx($institucion,'domicilio_municipio_id'); ?>
					<div class="input">
						<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
						      'model'=>$institucion, 
						      'attribute'=>'domicilio_municipio_id', 
						      'sourceUrl'=>Yii::app()->createUrl('municipio/autocompletesearch'), 
						     'showFKField'=>false,
						      'relName'=>'domicilioMunicipio', // the relation name defined above
						      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

						      'options'=>array(
						          'minLength'=>1, 
						      ),
						 )); ?>
						<?php echo $form->error($institucion,'domicilio_municipio_id'); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<b>Contacto</b>
	<div class='well'>
		<div class='row-fluid show-grid'>
			<div class='span6'>
				<div class="<?php echo $form->fieldClass($institucion, 'contacto_telefono'); ?>">
					<?php echo $form->labelEx($institucion,'contacto_telefono'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'contacto_telefono',array('size'=>45,'maxlength'=>45)); ?>
						<?php echo $form->error($institucion,'contacto_telefono'); ?>
					</div>
				</div>

				<div class="<?php echo $form->fieldClass($institucion, 'contacto_fax'); ?>">
					<?php echo $form->labelEx($institucion,'contacto_fax'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'contacto_fax',array('size'=>45,'maxlength'=>45)); ?>
						<?php echo $form->error($institucion,'contacto_fax'); ?>
					</div>
				</div>
			</div>
			<div class='span6'>
				<div class="<?php echo $form->fieldClass($institucion, 'contacto_email'); ?>">
					<?php echo $form->labelEx($institucion,'contacto_email'); ?>
					<div class="input">
						<?php echo $form->textField($institucion,'contacto_email',array('size'=>60,'maxlength'=>145)); ?>
						<?php echo $form->error($institucion,'contacto_email'); ?>
					</div>
				</div>
			</div>
		</div>
	</div>






	<div class="actions">
		<?php echo BHtml::submitButton($institucion->isNewRecord ? 'Registrar' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->