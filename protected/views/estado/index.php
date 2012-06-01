<?php
$this->pageCaption='Estado';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar estado';
$this->breadcrumbs=array(
	'Estado',
);

$this->menu=array(
	array('label'=>'Crear Estado', 'url'=>array('create')),
	array('label'=>'Administrar Estado', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
