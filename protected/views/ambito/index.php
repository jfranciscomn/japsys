<?php
$this->pageCaption='Ambito';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ambito';
$this->breadcrumbs=array(
	'Ambito',
);

$this->menu=array(
	array('label'=>'Crear Ambito', 'url'=>array('create')),
	array('label'=>'Administrar Ambitos', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
