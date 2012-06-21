<?php
$this->pageCaption='Create IngresoPorEvento';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ingresoporevento';
$this->breadcrumbs=array(
	'Ingreso Por Evento'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Evento', 'url'=>array('index')),
	array('label'=>'Administrar Ingreso Por Evento', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>