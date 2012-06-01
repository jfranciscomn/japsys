<?php
$this->pageCaption='Administrar Municipio';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar municipio';
$this->breadcrumbs=array(
	'Municipio'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Municipios', 'url'=>array('index')),
	array('label'=>'Crear Municipio', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('municipio-grid', {
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
	'id'=>'municipio-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'clave',
		'nombre',
		array(	'name'=>'estado_id',
		        'value'=>'$data->estado->nombre',
			    'filter'=>CHtml::listData(Estado::model()->findAll(), 'id', 'nombre'),),
		array(	'name'=>'estatus',
		        'value'=>'$data->estatus0->nombre',
			    'filter'=>CHtml::listData(Estatus::model()->findAll(), 'id', 'nombre'),),
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
