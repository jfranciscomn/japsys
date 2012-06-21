<?php
$this->pageCaption='Gasto Operativo';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar gasto operativo';
$this->breadcrumbs=array(
	'Gasto Operativo',
);

$this->menu=array(
	array('label'=>'Crear GastoOperativo', 'url'=>array('create')),
	array('label'=>'Administrar GastoOperativo', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
