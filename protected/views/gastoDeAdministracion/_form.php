<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'gasto-de-administracion-form',
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

	<div class="<?php echo $form->fieldClass($model, 'institucion_id'); ?>">
		<?php echo $form->labelEx($model,'institucion_id'); ?>
		<div class="input">
			
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
					      'model'=>$model, 
					      'attribute'=>'institucion_id', 
					      'sourceUrl'=>Yii::app()->createUrl('institucion/autocompletesearch'), 
					      'showFKField'=>false,
					      'relName'=>'institucion', // the relation name defined above
					      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

					      'options'=>array(
					          'minLength'=>1, 
					      ),
					 )); ?>			<?php echo $form->error($model,'institucion_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ejercicio_id'); ?>">
		<?php echo $form->labelEx($model,'ejercicio_id'); ?>
		<div class="input">
			
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
					      'model'=>$model, 
					      'attribute'=>'ejercicio_id', 
					      'sourceUrl'=>Yii::app()->createUrl('ejercicio/autocompletesearch'), 
					      'showFKField'=>false,
					      'relName'=>'ejercicio', // the relation name defined above
					      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

					      'options'=>array(
					          'minLength'=>1, 
					      ),
					 )); ?>			<?php echo $form->error($model,'ejercicio_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'estatus_id'); ?>">
		<?php echo $form->labelEx($model,'estatus_id'); ?>
		<div class="input">
			
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
					      'model'=>$model, 
					      'attribute'=>'estatus_id', 
					      'sourceUrl'=>Yii::app()->createUrl('estatus/autocompletesearch'), 
					      'showFKField'=>false,
					      'relName'=>'estatus', // the relation name defined above
					      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

					      'options'=>array(
					          'minLength'=>1, 
					      ),
					 )); ?>			<?php echo $form->error($model,'estatus_id'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'editable'); ?>">
		<?php echo $form->labelEx($model,'editable'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'editable'); ?>
			<?php echo $form->error($model,'editable'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ultimaModificacion'); ?>">
		<?php echo $form->labelEx($model,'ultimaModificacion'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'ultimaModificacion'); ?>
			<?php echo $form->error($model,'ultimaModificacion'); ?>
		</div>
	</div>

	<div class="actions">
		<?php echo BHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->