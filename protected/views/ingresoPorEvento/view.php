<?php
$this->pageCaption='Ver IngresoPorEvento #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Evento'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Evento', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorEvento', 'url'=>array('create')),
	array('label'=>'Actualizar IngresoPorEvento', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar IngresoPorEvento', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Ingreso Por Evento', 'url'=>array('admin')),
);
?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'baseScriptUrl'=>false,
	'cssFile'=>false,
	'htmlOptions'=>array('class'=>'table table-bordered table-striped'),
	'attributes'=>array(
		'id',
		'colectas',
		'eventos',
		'rifas',
		'desayunos',
		'conferencias',
		'institucion_id',
		'ejercicio_id',
		'estatus_id',
		'editable',
		'ultimaModificacion',
	),
)); ?>
