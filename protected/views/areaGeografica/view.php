<?php
$this->pageCaption='Ver AreaGeografica #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Area Geografica'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar Areas Geograficas', 'url'=>array('index')),
	array('label'=>'Crear Area Geografica', 'url'=>array('create')),
	array('label'=>'Actualizar Area Geografica', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar Area Geografica', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Areas Geograficas', 'url'=>array('admin')),
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
		array(
			'name'=>'estatus',
			'value'=>$model->estatus0->nombre,
			),
	),
)); ?>
