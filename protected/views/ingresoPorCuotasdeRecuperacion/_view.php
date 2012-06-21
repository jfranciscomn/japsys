	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->consultas); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->despensas); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->otro); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->institucion_id); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ejercicio_id); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->estatus_id); ?>
		</td>
		<?php /*
		<td>
			<?php echo CHtml::encode($data->editable); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ultimaModificacion); ?>
		</td>
		*/ ?>
	</tr>