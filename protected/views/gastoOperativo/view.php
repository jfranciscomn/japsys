<?php
$this->pageCaption='Ver GastoOperativo #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Gasto Operativo'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Gasto Operativo', 'url'=>array('index')),
	array('label'=>'Crear GastoOperativo', 'url'=>array('create')),
	array('label'=>'Actualizar GastoOperativo', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar GastoOperativo', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Gasto Operativo', 'url'=>array('admin')),
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
		'renta',
		'impuestosDerechos',
		'otros',
		array(	'name'=>'institucion_aid',
		        'value'=>$model->institucion->nombre,),
		array(	'name'=>'ejercicioFiscal_did',
		        'value'=>$model->ejercicioFiscal->nombre,),
		array(	'name'=>'estatus_did',
		        'value'=>$model->estatus->nombre,),
		'editable',
		'ultimaModificacion_dt',
	),
)); ?>
