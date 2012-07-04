<?php
$this->pageCaption='Ver Ambito #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Ambito'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Ambito', 'url'=>array('index')),
	array('label'=>'Crear Ambito', 'url'=>array('create')),
	array('label'=>'Actualizar Ambito', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar Ambito', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Ambito', 'url'=>array('admin')),
);
?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'baseScriptUrl'=>false,
	'cssFile'=>false,
	'htmlOptions'=>array('class'=>'table table-bordered table-striped'),
	'attributes'=>array(
		'id',
		'nombre',
		array(	'name'=>'estatus_did',
		        'value'=>$model->estatus->nombre,),
	),
)); ?>
