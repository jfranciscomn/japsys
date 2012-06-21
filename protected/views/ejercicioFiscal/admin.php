<?php
$this->pageCaption='Manage Ejercicio Fiscal';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar ejercicio fiscal';
$this->breadcrumbs=array(
	'Ejercicio Fiscal'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Ejercicio Fiscal', 'url'=>array('index')),
	array('label'=>'Crear EjercicioFiscal', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('ejercicio-fiscal-grid', {
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
	'id'=>'ejercicio-fiscal-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'nombre',
		'fecha_inicio',
		'fecha_fin',
		array(	'name'=>'estatus_id',
		        'value'=>'$data->estatus->nombre',
			    'filter'=>CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre'),),
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
