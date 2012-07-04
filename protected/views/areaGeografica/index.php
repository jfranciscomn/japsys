<?php
$this->pageCaption='Area Geografica';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar area geografica';
$this->breadcrumbs=array(
	'Area Geografica',
);

$this->menu=array(
	array('label'=>'Crear AreaGeografica', 'url'=>array('create')),
	array('label'=>'Administrar AreaGeografica', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
