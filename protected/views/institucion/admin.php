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
		'domicio_direccion',
		/*
		'domicilio_cp',
		'domicilio_estado_id',
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
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
