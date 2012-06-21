<?php
$this->pageCaption='Ingreso Por Evento';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ingreso por evento';
$this->breadcrumbs=array(
	'Ingreso Por Evento',
);

$this->menu=array(
	array('label'=>'Crear IngresoPorEvento', 'url'=>array('create')),
	array('label'=>'Administrar IngresoPorEvento', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
