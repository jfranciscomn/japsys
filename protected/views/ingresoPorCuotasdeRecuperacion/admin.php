<?php
$this->pageCaption='Manage Ingreso Por Cuotasde Recuperacion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar ingreso por cuotasde recuperacion';
$this->breadcrumbs=array(
	'Ingreso Por Cuotasde Recuperacion'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Cuotasde Recuperacion', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorCuotasdeRecuperacion', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('ingreso-por-cuotasde-recuperacion-grid', {
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
	'id'=>'ingreso-por-cuotasde-recuperacion-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'consultas',
		'despensas',
		'otro',
		'institucion_id',
		'ejercicio_id',
		/*
		'estatus_id',
		'editable',
		'ultimaModificacion',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
