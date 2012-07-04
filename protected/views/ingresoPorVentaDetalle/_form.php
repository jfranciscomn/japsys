<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'ingreso-por-venta-detalle-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'concepto'); ?>">
		<?php echo $form->labelEx($model,'concepto'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'concepto',array('size'=>60,'maxlength'=>150)); ?>
			<?php echo $form->error($model,'concepto'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'cantidad'); ?>">
		<?php echo $form->labelEx($model,'cantidad'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'cantidad'); ?>
			<?php echo $form->error($model,'cantidad'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'ingresoPorVenta_aid'); ?>">
		<?php echo $form->labelEx($model,'ingresoPorVenta_aid'); ?>
		<div class="input">
			
			<?php $this->widget('ext.custom.widgets.EJuiAutoCompleteFkField', array(
					      'model'=>$model, 
					      'attribute'=>'ingresoPorVenta_aid', 
					      'sourceUrl'=>Yii::app()->createUrl('ingresoPorVenta/autocompletesearch'), 
					      'showFKField'=>false,
					      'relName'=>'ingresoPorVenta', // the relation name defined above
					      'displayAttr'=>'nombre',  // attribute or pseudo-attribute to display

					      'options'=>array(
					          'minLength'=>1, 
					      ),
					 )); ?>			<?php echo $form->error($model,'ingresoPorVenta_aid'); ?>
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