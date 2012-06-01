<?php
$this->pageCaption='Municipio';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar municipio';
$this->breadcrumbs=array(
	'Municipio',
);

$this->menu=array(
	array('label'=>'Crear Municipio', 'url'=>array('create')),
	array('label'=>'Administrar Municipio', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
