<?php
$this->pageCaption='Manage Institucion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar institucion';
$this->breadcrumbs=array(
	'Institucion'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Institucion', 'url'=>array('index')),
	array('label'=>'Crear Institucion', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('institucion-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>



<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'institucion-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'nombre',
		'siglas',
		'mision',
		'vision',
		'domicioDireccion',
		/*
		'domicilioCP',
		array(	'name'=>'municipio_aid',
		        'value'=>'$data->municipio->nombre',
			    'filter'=>CHtml::listData(Municipio::model()->findAll(), 'id', 'nombre'),),
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
		        'value'=>'$data->ambito->nombre',
			    'filter'=>CHtml::listData(Ambito::model()->findAll(), 'id', 'nombre'),),
		array(	'name'=>'areaGeografica_did',
		        'value'=>'$data->areaGeografica->nombre',
			    'filter'=>CHtml::listData(AreaGeografica::model()->findAll(), 'id', 'nombre'),),
		'horasPromedio_trabajador',
		array(	'name'=>'estatus_did',
		        'value'=>'$data->estatus->nombre',
			    'filter'=>CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre'),),
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
