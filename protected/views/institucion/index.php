<?php
$this->pageCaption='Institucion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar institucion';
$this->breadcrumbs=array(
	'Institucion',
);

$this->menu=array(
	array('label'=>'Crear Institucion', 'url'=>array('create')),
	array('label'=>'Administrar Institucion', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
