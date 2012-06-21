<?php
$this->pageCaption='Ejercicio Fiscal';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ejercicio fiscal';
$this->breadcrumbs=array(
	'Ejercicio Fiscal',
);

$this->menu=array(
	array('label'=>'Crear EjercicioFiscal', 'url'=>array('create')),
	array('label'=>'Administrar EjercicioFiscal', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
