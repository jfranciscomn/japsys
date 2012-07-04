<?php
$this->pageCaption='Ver AreaGeografica #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Area Geografica'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Area Geografica', 'url'=>array('index')),
	array('label'=>'Crear AreaGeografica', 'url'=>array('create')),
	array('label'=>'Actualizar AreaGeografica', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar AreaGeografica', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Area Geografica', 'url'=>array('admin')),
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
