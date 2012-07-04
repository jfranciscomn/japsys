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
		'domicioDireccion',
		'domicilioCP',
		array(	'name'=>'municipio_aid',
		        'value'=>$model->municipio->nombre,),
		'contactoTelefono',
		'contactoFax',
		'contactoEmail',
		'fechaConstitucion_dt',
		'fechaTransformacion_dt',
		'rfc',
		'donativoDeducible',
		'donativoConvenio',
		'cluni',
		array(	'name'=>'ambito_did',
		        'value'=>$model->ambito->nombre,),
		array(	'name'=>'areaGeografica_did',
		        'value'=>$model->areaGeografica->nombre,),
		'horasPromedio_trabajador',
		array(	'name'=>'estatus_did',
		        'value'=>$model->estatus->nombre,),
	),
)); ?>
