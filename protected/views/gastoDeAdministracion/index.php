<?php
$this->pageCaption='Gasto De Administracion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Listar gasto de administracion';
$this->breadcrumbs=array(
	'Gasto De Administracion',
);

$this->menu=array(
	array('label'=>'Crear GastoDeAdministracion', 'url'=>array('create')),
	array('label'=>'Administrar GastoDeAdministracion', 'url'=>array('admin')),
);
?>

<?php $this->widget('ext.custom.widgets.CCustomListView', array(
	'dataProvider'=>$dataProvider,
	'headersview' =>'_headersview',
	'footersview' => '_footersview',
	'itemView'=>'_view',
)); ?>
