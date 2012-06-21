<?php
$this->pageCaption='Ver Institucion #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Institucion'=>array('index'),
	$model->id,
);
$valores=array('1'=>'Autorizado', '2'=>'No Autorizado');

$this->menu=array(
	array('label'=>'Listar Institucion', 'url'=>array('index')),
	array('label'=>'Crear Institucion', 'url'=>array('create')),
	array('label'=>'Actualizar Institucion', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Eliminar Institucion', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'¿Estas seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Institucion', 'url'=>array('admin')),
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
		'siglas',
		'mision',
		'vision',
		'domicio_direccion',
		'domicilio_cp',
		array(
			'name'=>'domicilio_municipio_id',
			'value'=>$model->domicilioMunicipio->nombre,
			),
		'contacto_telefono',
		'contacto_fax',
		'contacto_email',
		'fecha_constitucion',
		'fecha_transformacion',
		'rfc',
		array(
			'name'=>'donativo_deducible',
			'value'=>$valores[$model->donativo_deducible],
			),
		array(
			'name'=>'donativo_convenio',
			'value'=>$valores[$model->donativo_convenio],
			),
		'cluni',
		array(
			'name'=>'ambito_id',
			'value'=>$model->ambito->nombre,
			),
		array(
			'name'=>'areageografica_id',
			'value'=>$model->areageografica->nombre,
			),
		'horas_promedio_trabajador',
		array(
			'name'=>'estatus',
			'value'=>$model->estatus0->nombre,
			),
	),
)); ?>
