<?php
$this->pageCaption='Create IngresoPorVenta';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ingresoporventa';
$this->breadcrumbs=array(
	'Ingreso Por Venta'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Venta', 'url'=>array('index')),
	array('label'=>'Administrar Ingreso Por Venta', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>