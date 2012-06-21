<?php
$this->pageCaption='Ver IngresoPorCuotasdeRecuperacion #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Cuotasde Recuperacion'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Cuotasde Recuperacion', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorCuotasdeRecuperacion', 'url'=>array('create')),
	array('label'=>'Actualizar IngresoPorCuotasdeRecuperacion', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar IngresoPorCuotasdeRecuperacion', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Ingreso Por Cuotasde Recuperacion', 'url'=>array('admin')),
);
?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'baseScriptUrl'=>false,
	'cssFile'=>false,
	'htmlOptions'=>array('class'=>'table table-bordered table-striped'),
	'attributes'=>array(
		'id',
		'consultas',
		'despensas',
		'otro',
		'institucion_id',
		'ejercicio_id',
		'estatus_id',
		'editable',
		'ultimaModificacion',
	),
)); ?>
