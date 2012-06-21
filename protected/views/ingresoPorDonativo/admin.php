<?php
$this->pageCaption='Manage Ingreso Por Donativo';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar ingreso por donativo';
$this->breadcrumbs=array(
	'Ingreso Por Donativo'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Ingreso Por Donativo', 'url'=>array('index')),
	array('label'=>'Crear IngresoPorDonativo', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('ingreso-por-donativo-grid', {
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
	'id'=>'ingreso-por-donativo-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'personaFisica',
		'personaMoral',
		'fundacionesNacionales',
		'fundacionesExtrajeras',
		'fondosGubernamentales',
		/*
		'especie',
		'institucion_id',
		'ejercicio_id',
		'estatus_id',
		'editable',
		'ultimaModificacion',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
