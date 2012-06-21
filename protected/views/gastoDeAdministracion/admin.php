<?php
$this->pageCaption='Manage Gasto De Administracion';
$this->pageTitle=Yii::app()->name . ' - ' . $this->pageCaption;
$this->pageDescription='Administar gasto de administracion';
$this->breadcrumbs=array(
	'Gasto De Administracion'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Gasto De Administracion', 'url'=>array('index')),
	array('label'=>'Crear GastoDeAdministracion', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('gasto-de-administracion-grid', {
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
	'id'=>'gasto-de-administracion-grid',
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
