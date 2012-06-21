<?php
$this->pageCaption='Ingreso Por Venta';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ingreso por venta';
$this->breadcrumbs=array(
	'Ingreso Por Venta',
);

$this->menu=array(
	array('label'=>'Crear IngresoPorVenta', 'url'=>array('create')),
	array('label'=>'Administrar IngresoPorVenta', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
