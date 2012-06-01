<?php
$this->pageCaption='Areas Geograficas';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar areas geograficas';
$this->breadcrumbs=array(
	'Areas Geograficas',
);

$this->menu=array(
	array('label'=>'Crear Area Geografica', 'url'=>array('create')),
	array('label'=>'Administrar Areas Geograficas', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
