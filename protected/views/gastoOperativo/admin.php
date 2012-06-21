<?php
$this->pageCaption='Manage Gasto Operativo';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar gasto operativo';
$this->breadcrumbs=array(
	'Gasto Operativo'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Gasto Operativo', 'url'=>array('index')),
	array('label'=>'Crear GastoOperativo', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('gasto-operativo-grid', {
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
	'id'=>'gasto-operativo-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'cssFile'=>Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('ext.bootstrap-theme.widgets.assets')).'/gridview/styles.css',
	'itemsCssClass'=>'table  table-striped',
	'columns'=>array(
		'id',
		'sueldos',
		'honorarios',
		'combustibles',
		'luzTelefono',
		'papeleria',
		/*
		'renta',
		'impuestosDerechos',
		'otros',
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
