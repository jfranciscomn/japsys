<?php
$this->pageCaption='Actualizar IngresoPorVenta '.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ingreso Por Venta'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Venta', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorVenta', 'url'=>array('create')),
	array('label'=>'Ver IngresoPorVenta', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Administrar Ingreso Por Venta', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>