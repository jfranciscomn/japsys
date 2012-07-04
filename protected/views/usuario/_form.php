<div class="form">

<?php $form=$this->beginWidget('BActiveForm', array(
	'id'=>'usuario-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php $this->widget('BAlert',array(

		'content'=>'<p>Los campos marcados con <span class="required">*</span> son requeridos.</p>'
	)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="<?php echo $form->fieldClass($model, 'usuario'); ?>">
		<?php echo $form->labelEx($model,'usuario'); ?>
		<div class="input">
			
			<?php echo $form->textField($model,'usuario',array('size'=>45,'maxlength'=>45)); ?>
			<?php echo $form->error($model,'usuario'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'password'); ?>">
		<?php echo $form->labelEx($model,'password'); ?>
		<div class="input">
			
			<?php echo $form->passwordField($model,'password',array('size'=>60,'maxlength'=>150)); ?>
			<?php echo $form->error($model,'password'); ?>
		</div>
	</div>

	<div class="<?php echo $form->fieldClass($model, 'tipousuario_did'); ?>">
		<?php echo $form->labelEx($model,'tipousuario_did'); ?>
		<div class="input">
			
			<?php echo $form->dropDownList($model,tipousuario_did,CHtml::listData(Tipousuario::model()->findAll(), 'id', 'nombre')); ?>			<?php echo $form->error($model,'tipousuario_did'); ?>
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