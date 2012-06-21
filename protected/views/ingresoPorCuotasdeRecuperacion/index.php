<?php
$this->pageCaption='Ingreso Por Cuotasde Recuperacion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar ingreso por cuotasde recuperacion';
$this->breadcrumbs=array(
	'Ingreso Por Cuotasde Recuperacion',
);

$this->menu=array(
	array('label'=>'Crear IngresoPorCuotasdeRecuperacion', 'url'=>array('create')),
	array('label'=>'Administrar IngresoPorCuotasdeRecuperacion', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
