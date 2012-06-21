<?php
$this->pageCaption='Create IngresoPorDonativo';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ingresopordonativo';
$this->breadcrumbs=array(
	'Ingreso Por Donativo'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Donativo', 'url'=>array('index')),
	array('label'=>'Administrar Ingreso Por Donativo', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>