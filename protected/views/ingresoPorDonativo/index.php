<?php
$this->pageCaption='Ingreso Por Donativo';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ingreso por donativo';
$this->breadcrumbs=array(
	'Ingreso Por Donativo',
);

$this->menu=array(
	array('label'=>'Crear IngresoPorDonativo', 'url'=>array('create')),
	array('label'=>'Administrar IngresoPorDonativo', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
