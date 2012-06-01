<?php
$this->pageCaption='Ver Institucion #'.$model->id;
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='';
$this->breadcrumbs=array(
	'Institucion'=>array('index'),
	$model->id,
);

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
		'domicilio_municipio_id',
		'contacto_telefono',
		'contacto_fax',
		'contacto_email',
		'fecha_constitucion',
		'fecha_transformacion',
		'rfc',
		'donativo_deducible',
		'donativo_convenio',
		'cluni',
		'ambito_id',
		'areageografica_id',
		'horas_promedio_trabajador',
		'estatus',
	),
)); ?>
