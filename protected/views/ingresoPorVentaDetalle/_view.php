	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->concepto); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->cantidad); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ingresoPorVenta_id); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->estatus_id); ?>
		</td>
	</tr>