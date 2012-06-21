<?php
$this->pageCaption='Ingreso Por Venta Detalle';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ingreso por venta detalle';
$this->breadcrumbs=array(
	'Ingreso Por Venta Detalle',
);

$this->menu=array(
	array('label'=>'Crear IngresoPorVentaDetalle', 'url'=>array('create')),
	array('label'=>'Administrar IngresoPorVentaDetalle', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
