<?php
$this->pageCaption='Ver EjercicioFiscal #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ejercicio Fiscal'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Ejercicio Fiscal', 'url'=>array('index')),
	array('label'=>'Crear EjercicioFiscal', 'url'=>array('create')),
	array('label'=>'Actualizar EjercicioFiscal', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar EjercicioFiscal', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Ejercicio Fiscal', 'url'=>array('admin')),
);
?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'baseScriptUrl'=>false,
	'cssFile'=>false,
	'htmlOptions'=>array('class'=>'table table-bordered table-striped'),
	'attributes'=>array(
		'id',
		'nombre',
		'fecha_inicio',
		'fecha_fin',
		array(
			'name'=>'estatus_id',
			'value'=>$model->estatus->nombre,
			),
	),
)); ?>
