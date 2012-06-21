<?php
$this->pageCaption='Actualizar IngresoPorVentaDetalle '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Venta Detalle'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Venta Detalle', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorVentaDetalle', 'url'=>array('create')),
	array('label'=>'Ver IngresoPorVentaDetalle', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ingreso Por Venta Detalle', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>