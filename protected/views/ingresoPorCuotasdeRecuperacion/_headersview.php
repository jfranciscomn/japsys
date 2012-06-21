<table class="table table-bordered table-striped">
	<tr>
		<td class='span2'>
			<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('consultas')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('despensas')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('otro')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('institucion_id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('ejercicio_id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('estatus_id')); ?></b>
		</td>
		<?php /*
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('editable')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('ultimaModificacion')); ?></b>
		</td>
		*/ ?>
	</tr>