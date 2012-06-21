<?php
$this->pageCaption='Create IngresoPorVentaDetalle';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ingresoporventadetalle';
$this->breadcrumbs=array(
	'Ingreso Por Venta Detalle'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Venta Detalle', 'url'=>array('index')),
	array('label'=>'Administrar Ingreso Por Venta Detalle', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>