<?php
$this->pageCaption='Create EjercicioFiscal';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Crear nuevo ejerciciofiscal';
$this->breadcrumbs=array(
	'Ejercicio Fiscal'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Listar Ejercicio Fiscal', 'url'=>array('index')),
	array('label'=>'Administrar Ejercicio Fiscal', 'url'=>array('admin')),
);
?>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>