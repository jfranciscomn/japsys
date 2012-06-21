<table class="table table-bordered table-striped">
	<tr>
		<td class='span2'>
			<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('personaFisica')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('personaMoral')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('fundacionesNacionales')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('fundacionesExtrajeras')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('fondosGubernamentales')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('especie')); ?></b>
		</td>
		<?php /*
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('institucion_id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('ejercicio_id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('estatus_id')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('editable')); ?></b>
		</td>
		<td >
			<b><?php echo CHtml::encode($data->getAttributeLabel('ultimaModificacion')); ?></b>
		</td>
		*/ ?>
	</tr>