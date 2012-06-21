<?php
$this->pageCaption='Ver IngresoPorVentaDetalle #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Venta Detalle'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Venta Detalle', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorVentaDetalle', 'url'=>array('create')),
	array('label'=>'Actualizar IngresoPorVentaDetalle', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar IngresoPorVentaDetalle', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Ingreso Por Venta Detalle', 'url'=>array('admin')),
);
?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'baseScriptUrl'=>false,
	'cssFile'=>false,
	'htmlOptions'=>array('class'=>'table table-bordered table-striped'),
	'attributes'=>array(
		'id',
		'concepto',
		'cantidad',
		'ingresoPorVenta_id',
		'estatus_id',
	),
)); ?>
