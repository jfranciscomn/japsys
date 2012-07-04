<?php
$this->pageCaption='Ver GastoDeAdministracion #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Gasto De Administracion'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Gasto De Administracion', 'url'=>array('index')),
	array('label'=>'Crear GastoDeAdministracion', 'url'=>array('create')),
	array('label'=>'Actualizar GastoDeAdministracion', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar GastoDeAdministracion', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Gasto De Administracion', 'url'=>array('admin')),
);
?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'baseScriptUrl'=>false,
	'cssFile'=>false,
	'htmlOptions'=>array('class'=>'table table-bordered table-striped'),
	'attributes'=>array(
		'id',
		'sueldos',
		'honorarios',
		'combustibles',
		'luzTelefono',
		'papeleria',
		'impuestosDerechos',
		'otros',
		array(	'name'=>'institucion_aid',
		        'value'=>$model->institucion->nombre,),
		array(	'name'=>'ejercicioFisca_did',
		        'value'=>$model->ejercicioFisca->nombre,),
		array(	'name'=>'estatus_did',
		        'value'=>$model->estatus->nombre,),
		'editable',
		'ultimaModificacion_dt',
	),
)); ?>
