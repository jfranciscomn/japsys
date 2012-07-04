<?php
$this->pageCaption='Manage Ingreso Por Evento';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar ingreso por evento';
$this->breadcrumbs=array(
	'Ingreso Por Evento'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Evento', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorEvento', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('ingreso-por-evento-grid', {
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
	'id'=>'ingreso-por-evento-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'colectas',
		'eventos',
		'rifas',
		'desayunos',
		'conferencias',
		/*
		array(	'name'=>'institucion_aid',
		        'value'=>'$data->institucion->nombre',
			    'filter'=>CHtml::listData(Institucion::model()->findAll(), 'id', 'nombre'),),
		array(	'name'=>'ejercicioFiscal_did',
		        'value'=>'$data->ejercicioFiscal->nombre',
			    'filter'=>CHtml::listData(EjercicioFiscal::model()->findAll(), 'id', 'nombre'),),
		array(	'name'=>'estatus_did',
		        'value'=>'$data->estatus->nombre',
			    'filter'=>CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre'),),
		'editable',
		'ultimaModificacion_dt',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
